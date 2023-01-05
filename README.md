# Danora Linux

[![build-danora](https://github.com/ultra980/danora-linux/actions/workflows/build.yml/badge.svg)](https://github.com/ultra980/danora-linux/actions/workflows/build.yml)

[![build-rawhide](https://github.com/ultra980/danora-linux/actions/workflows/build_rawhide.yml/badge.svg)](https://github.com/ultra980/danora-linux/actions/workflows/build_rawhide.yml)

A (still work-in-progress) gaming-focused setup for Fedora Kinoite, inspired by Nobara Linux.

## Installation
### Fedora Kinoite/Silverblue
If you want to install Danora on top of an existing Fedora Kinoite/Silverblue installation, follow the steps below.
> Note: Danora WILL install the KDE Plasma Desktop Enviorment, even if installed on top of Silverblue

Warning: This is experimental on our upstream distro, `ublue`, so try it first in a VM. You have been warned!

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ultra980/danora:latest

We build date tags as well, so if you want to rebase to a particular day's release:
  
    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ultra980/danora:20221217 

The `latest` tag will automatically point to the latest build. 

We also build rawhide (rolling) images, but these might be *very unstable*, try them at your own risk.

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ultra980/danora:rawhide

### Podman/Docker
If you wish to try Danora out in a container, you can use the `ghcr.io/Ultra980/danora` prebuilt image:

    podman run -it ghcr.io/Ultra980/danora bash

To install on `docker`, simply replace "docker" with "podman"

## Features

- Start with a base Fedora Kinoite 37 image
- Removes Firefox from the base image
- Adds the following packages to the base image:
  - distrobox, fish, xonsh, wine 
- Sets automatic staging of updates for the system
- Sets flatpaks to update twice a day
- Everything else (desktop, artwork, etc) remains stock so you can use this as a good starting image

  
## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/ultra980/danora-linux
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions. 

<!--- TODO:  --->

## Credits
**Credits may not always be up to date**
- Jorge Castro and `ublue` for the base repo
- Fedora Silverblue and Kionite for the base immutable OS
- GloriousEggroll and the Nobara team for inspiring Danora
