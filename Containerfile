ARG FEDORA_MAJOR_VERSION=41

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

# Copy files over root
COPY rootfs/etc/dconf/ /etc/dconf/
COPY rootfs/etc/yum.repos.d/ /etc/yum.repos.d/
COPY cosign.pub /etc/pki/containers/

# Add Copr repository for mutter-performance
RUN curl -o /etc/yum.repos.d/execat-mutter-performance.repo \
    https://copr.fedorainfracloud.org/coprs/execat/mutter-performance/repo/fedora-${FEDORA_MAJOR_VERSION}/execat-mutter-performance-fedora-${FEDORA_MAJOR_VERSION}.repo

# Install needed packages
RUN rpm-ostree install \
    unrar \
    aria2 \
    lm_sensors

# Install codecs
RUN rpm-ostree install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    rpm-ostree install rpmfusion-free-release rpmfusion-nonfree-release && \
    rpm-ostree install intel-media-driver libva-intel-driver && \
    rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi

# Install cosign
ENV WGETRC=/dev/null
RUN wget https://github.com/sigstore/cosign/releases/download/v2.0.0/cosign-linux-amd64 -O /tmp/cosign && \
    install -c -m 0755 /tmp/cosign /usr/bin

# Patch mutter
RUN rpm-ostree override replace --experimental --from=repo=execat-mutter-performance mutter

# Cleanup & Finalize
RUN rm -rf /tmp/* /var/* && \
    rm -rf /usr/share/gnome-shell/extensions/background-logo@fedorahosted.org && \
    rm -f /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo && \
    rm -f /etc/yum.repos.d/fedora-cisco-openh264.repo && \
    rpm-ostree cleanup -m && \
    ostree container commit
