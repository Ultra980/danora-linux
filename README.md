# Danora Linux

[![build-danora](https://github.com/ultra980/danora-linux/actions/workflows/build.yml/badge.svg)](https://github.com/ultra980/danora-linux/actions/workflows/build.yml)

A (still work-in-progress) gaming-focused setup for Fedora Kinoite, inspired by Nobara Linux.

## Usage

Warning: This is an experimental feature and should not be used in production, try it in a VM for a while, you have been warned!

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ultra980/danora-linux:latest
    
We build date tags as well, so if you want to rebase to a particular day's release:
  
    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ultra980/danora-linux:20221217 

The `latest` tag will automatically point to the latest build. 

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

