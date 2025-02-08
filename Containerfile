# Use the Silverblue base image
ARG FEDORA_MAJOR_VERSION=41
FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

# Copy files over root
COPY rootfs/etc/dconf/ /etc/dconf/
COPY rootfs/etc/yum.repos.d/ /etc/yum.repos.d/

# Enable the RPM Fusion repositories
RUN rpm-ostree install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_MAJOR_VERSION}.noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${FEDORA_MAJOR_VERSION}.noarch.rpm

# Install needed packages
RUN rpm-ostree install \
    unrar \
    aria2 \
    lm_sensors

# Install the patched mutter from the COPR repository
RUN rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:andrewdelosreyes:gnome-patched mutter

# Install cosign
RUN wget https://github.com/sigstore/cosign/releases/download/v2.0.0/cosign-linux-amd64 -O /tmp/cosign && \
    install -c -m 0755 /tmp/cosign /usr/bin && \
    rm -f /tmp/cosign

# Cleanup & Finalize
RUN rm -rf /tmp/* /var/*

# Final cleanup
RUN rpm-ostree cleanup -m

