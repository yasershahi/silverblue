ARG FEDORA_MAJOR_VERSION=38

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY rootfs/etc/dconf/ /etc/dconf/
COPY rootfs/etc/yum.repos.d/ /etc/yum.repos.d/
COPY rootfs/usr/lib/ /usr/lib/
COPY rootfs/usr/local/ /etc/local/
COPY rootfs/usr/share/ /etc/share/

RUN rpm-ostree install distrobox && \
    rpm-ostree install gnome-tweaks unrar aria2 neofetch podman-compose podman-docker xfburn yt-dlp nss-tools lm_sensors wireguard-tools tmux bash-color-prompt jetbrains-mono-fonts-all podman-plugins code python3-pip btop && \
    rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:trixieua:mutter-patched mutter mutter-common xorg-x11-server-Xwayland && \
    rpm-ostree override remove toolbox gnome-classic-session gnome-tour && \
    rpm-ostree install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    rpm-ostree install rpmfusion-free-release rpmfusion-nonfree-release \
    --uninstall rpmfusion-free-release \
    --uninstall rpmfusion-nonfree-release && \
    rpm-ostree install intel-media-driver libva-intel-driver && \
    rpm-ostree override remove mesa-va-drivers --install=mesa-va-drivers-freeworld --install=mesa-vdpau-drivers-freeworld && \
    rpm-ostree override remove libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg && \
    rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi steam-devices && \
    mkdir -p /etc/distrobox && \
    echo "container_image_default=\"registry.fedoraproject.org/fedora-toolbox:$(rpm -E %fedora)\"" >> /etc/distrobox/distrobox.conf && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=check/' /etc/rpm-ostreed.conf && \
    rm -rf /usr/share/gnome-shell/extensions/background-logo@fedorahosted.org && \
    systemctl enable flatpak-add-flathub-repo.service && \
    systemctl enable flatpak-replace-fedora-apps.service && \
    systemctl enable flatpak-cleanup.timer && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    systemctl enable dconf-update.service && \
    rpm-ostree cleanup -m && \
    ostree container commit
    
    
 # Install DevPod
RUN rpm-ostree install $(curl https://api.github.com/repos/loft-sh/devpod/releases/latest | jq -r '.assets[] | select(.name| test(".*x86_64.rpm$")).browser_download_url') && \
  wget https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64 -O /tmp/devpod && \
  install -c -m 0755 /tmp/devpod /usr/bin
  
# Install XDM
RUN wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz -O /tmp/xdm.tar.xz && \
    tar -xf xdm.tar.xz && \
    cd xdm && \
    ./install.sh
    
RUN rm -rf /tmp/* 
RUN ostree container commit
