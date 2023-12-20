[![build-image](https://github.com/yasershahi/silverblue/actions/workflows/build.yml/badge.svg)](https://github.com/yasershahi/silverblue/actions/workflows/build.yml)

# silverblue
This is my Fedora Silverblue Image. I daily drive this image on my main machine (ThinkPad X1 Extreme). You can fork it, customize and use it.
## Apps
### Flatpak
- Authenticator
- Obsidian
- NewsFlash
- GIMP
- Inkscape
- Lunacy
- KDEnlive
- Sound Recorder
- Gnome Boxes
- Poedit
- VSCode
- G4music
- Podcasts
- Mousai
- Spotify
- Telegram
- LibreOffice
- Thunderbird
- VLC
- Parabolic
- Motrix
- Flatseal
- PinApp
- Resources
- HandBrake
- OBS-Studio

### Packages
- nss-tools
- aria2
- distrobox
- sstp-client
- xfburn
- lm_sensors
- cosign
- yt-dlp
- unrar
- p7zip
- p7zip-plugins
- neofetch
- cmatrix
- fractal
- codects

### Inside Boexes
- Local by Flywheel
- DVD Styler

### Scripts
- [Figma font agent](https://github.com/neetly/figma-agent-linux)

## optimizations
- mutter-patched for smoother animations
- Xanmod Kernel for responsivness
- Increase priority of Flathub repository
- Set automatic checking of updates for the system
- Reduce systemd shutdown timers
- enable tap to click

## Installation
After installing Fedora Silverblue, rebase with this command:

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/yasershahi/silverblue:latest

These images are signed with Sisgstore's Cosign. You can verify the
signature by downloading the `cosign.pub` key from this repo and running the
following command:

    cosign verify --key cosign.pub ghcr.io/yasershahi/silverblue

## Thank You 
All credits goes to these projects:
[Bluefin](https://github.com/ublue-os/bluefin), 
[ublue-os](https://github.com/ublue-os/main), 
[BlueFusion](https://github.com/aguslr/bluefusion), 
[BlueVanilla](https://github.com/aguslr/bluevanilla), 
[awesome-custom-images](https://github.com/ublue-os/awesome-custom-images)


