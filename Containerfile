ARG FEDORA_MAJOR_VERSION=37
ARG FEDORA_DISTRO=fedora-kinoite
ARG IMAGE_REPO=ghcr.io/cgwalters

FROM ${IMAGE_REPO}/${FEDORA_DISTRO}:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc
COPY danora-firstboot /usr/bin
COPY install_waterfox /usr/bin

RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install distrobox fish xonsh wine zenity neofetch dash

RUN rm -f /bin/sh && ln -s /usr/bin/dash /bin/sh

RUN systemctl enable rpm-ostreed-automatic.timer && \
    systemctl enable flatpak-automatic.timer

RUN rpm-ostree cleanup -m && \
ostree container commit
