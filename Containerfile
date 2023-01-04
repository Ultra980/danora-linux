ARG FEDORA_MAJOR_VERSION=37

FROM ghcr.io/cgwalters/fedora-kinoite:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc
COPY danora-firstboot /usr/bin

RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install distrobox flatpak fish xonsh wine

RUN systemctl enable rpm-ostreed-automatic.timer &&
    systemctl enable flatpak-automatic.timer

RUN rpm-ostree cleanup -m && \
ostree container commit
