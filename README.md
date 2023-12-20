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
- Dconf-editor
- Gradience
- Extension Manager

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
- gnome-tweaks

### Drivers
- Nvidia Drivers with CUDA
- Intel media driver

### Distrobox
- Local by Flywheel
- DVD Styler

### Scripts
- [Figma font agent](https://github.com/neetly/figma-agent-linux)

### FireFox Add-ons
- [Floccus](https://addons.mozilla.org/en-US/firefox/addon/floccus/)
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
- [Bitwarden - Free Password Manager](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager)
- [I still don't care about cookies](https://addons.mozilla.org/en-US/firefox/addon/istilldontcareaboutcookies/)
- [Copy Selected Links](https://addons.mozilla.org/en-US/firefox/addon/copy-selected-links/)

## Optimizations
- mutter-patched for smoother animations
- RPM Fusion included
- Increase priority of Flathub repository
- Set automatic checking of updates for the system
- Reduce systemd shutdown timers
- Enable tap to click
- auto-cpufreq for better battery life

## Customization
### Gnome Plugins
- Dash to Dock
- User themes
- AppIndicator and KStatusNotifierItem

### Fonts
- Fira code
- Jetbrains mono
- ubuntu Fonts (not included)
- ibm-plex-mono-fonts
- google-cousine-fonts
- liberation-fonts

### Themes
- adw-gtk3-theme
- yaru themes


### Icons
- [Fluent icon theme](https://github.com/vinceliuice/Fluent-icon-theme)
- [macOS Cursors](https://github.com/ful1e5/apple_cursor)

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


