ARG FEDORA_MAJOR_VERSION=39

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

# Copy files over root
COPY rootfs/etc/dconf/ /etc/dconf/
COPY rootfs/etc/yum.repos.d/ /etc/yum.repos.d/
COPY rootfs/usr/lib/ /usr/lib/

# Enable cliwrap.
RUN rpm-ostree cliwrap install-to-root /

# Remove undesired packages
RUN rpm-ostree override remove \
    gnome-classic-session \
    gnome-tour \
    xorg-x11-drv-intel

# Install needed packages
RUN rpm-ostree install \
    gnome-tweaks \
    unrar \
    p7zip \
    p7zip-plugins \
    aria2 \
    neofetch \
    xfburn \
    net-tools \
    yt-dlp \
    nss-tools \
    lm_sensors \
    wireguard-tools \
    cmatrix \
    jetbrains-mono-fonts \
    fira-code-fonts \
    liberation-fonts \
    liberation-sans-fonts \
    liberation-serif-fonts \
    ibm-plex-mono-fonts \
    google-cousine-fonts \
    fractal \
    adw-gtk3-theme \
    adwaita-gtk2-theme \
    sstp-client \
    NetworkManager-sstp \
    NetworkManager-sstp-gnome \
    yaru-gtk2-theme \
    yaru-gtk3-theme \
    yaru-gtk4-theme \
    yaru-gtksourceview-theme \
    yaru-icon-theme \
    yaru-sound-theme \
    yaru-theme \
    libvirt \
    qemu-char-spice \
    qemu-device-display-virtio-gpu \
    qemu-device-display-virtio-vga \
    qemu-device-usb-redirect \
    qemu-img \
    qemu-system-x86-core \
    qemu-user-binfmt \
    qemu-user-static \
    qemu \
    virt-manager \
    gnome-boxes \
    dconf-editor \
    flatseal
    
    
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
    rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi

# Nvidia
RUN rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia-cuda nvidia-vaapi-driver libva-utils vdpauinfo

# Install Distrobox
RUN rpm-ostree install distrobox && \
    rpm-ostree override remove toolbox && \
    mkdir -p /etc/distrobox && \
    echo "container_image_default=\"registry.fedoraproject.org/fedora-toolbox:$(rpm -E %fedora)\"" >> /etc/distrobox/distrobox.conf

# Install auto-cpufreq
RUN cd /tmp && \
    git clone https://github.com/AdnanHodzic/auto-cpufreq.git && \
    cd auto-cpufreq && \
    echo "i" | sudo ./auto-cpufreq-installer

# Install cosign
RUN wget https://github.com/sigstore/cosign/releases/download/v2.0.0/cosign-linux-amd64 -O /tmp/cosign && \
    install -c -m 0755 /tmp/cosign /usr/bin

# Patch mutter
RUN rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:yasershahi:mutter-triplebuffer mutter mutter-common


# Cleanup & Finalize
RUN rm -rf /tmp/* /var/*
RUN systemctl enable dconf-update.service && \
    rm -rf /usr/share/gnome-shell/extensions/background-logo@fedorahosted.org && \
    rm -f /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo && \
    rm -f /etc/yum.repos.d/fedora-cisco-openh264.repo && \
    rm -f /etc/yum.repos.d/yasershahi-mutter-triplebuffer.repo && \
    systemctl enable flatpak-add-flathub-repo.service && \
    systemctl enable flatpak-replace-fedora-apps.service && \
    systemctl enable flatpak-cleanup.timer && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    rpm-ostree cleanup -m && \
    ostree container commit
    
