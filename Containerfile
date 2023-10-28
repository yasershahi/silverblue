ARG FEDORA_MAJOR_VERSION=39

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location


# Copy files over root
COPY rootfs/etc/dconf/ /etc/dconf/
COPY rootfs/etc/yum.repos.d/ /etc/yum.repos.d/
COPY rootfs/usr/lib/ /usr/lib/
COPY rootfs/usr/local/ /etc/local/
COPY rootfs/usr/share/ /etc/share/

# Remove undesired packages
RUN rpm-ostree override remove \
    gnome-classic-session \
    gnome-tour

# Install needed packages
RUN rpm-ostree install \
    podman-docker \
    podman-compose \
    podman-plugins \
    wireguard-tools \
    gnome-tweaks \
    unrar \
    aria2 \
    neofetch \
    xfburn \
    yt-dlp \
    nss-tools \
    lm_sensors \
    wireguard-tools \
    code \
    python3-pip \
    cmatrix \
    freetype-freeworld

# Install codecs
RUN rpm-ostree install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    rpm-ostree install rpmfusion-free-release rpmfusion-nonfree-release \
    --uninstall rpmfusion-free-release \
    --uninstall rpmfusion-nonfree-release && \
    rpm-ostree install intel-media-driver libva-intel-driver && \
    rpm-ostree override remove mesa-va-drivers --install=mesa-va-drivers-freeworld --install=mesa-vdpau-drivers-freeworld && \
    rpm-ostree override remove ffmpeg-free libavdevice-free libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg && \
    rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi steam-devices

# Install cosign
RUN wget https://github.com/sigstore/cosign/releases/download/v2.0.0/cosign-linux-amd64 -O /tmp/cosign && \
    install -c -m 0755 /tmp/cosign /usr/bin

# Patch mutter
RUN rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:yasershahi:mutter-triplebuffer mutter mutter-common

# Install xanmod kernel
RUN rpm-ostree override remove kernel kernel-core kernel-modules kernel-headers kernel-devel kernel-modules-extra --install kernel-xanmod-edge

# Install local-by-flywheel
RUN wget https://cdn.localwp.com/releases-stable/8.0.1+6490/local-8.0.1-linux.rpm -O /tmp/local.rpm && \
    rpm-ostree install /tmp/local.rpm

# Install Thoriom Browser
RUN wget https://github.com/Alex313031/thorium/releases/download/M117.0.5938.157/thorium-browser_117.0.5938.157.x86_64.rpm -O /tmp/thorium.rpm && \
    rpm-ostree install /tmp/thorium.rpm

#Cleanup & Finalize
RUN rm -rf /tmp/* /var/*
RUN systemctl enable dconf-update.service && \
    rm -rf /usr/share/gnome-shell/extensions/background-logo@fedorahosted.org && \
    systemctl enable flatpak-add-flathub-repo.service && \
    systemctl enable flatpak-replace-fedora-apps.service && \
    systemctl enable flatpak-cleanup.timer && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    rpm-ostree cleanup -m && \
    ostree container commit
    


