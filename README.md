[![build-image](https://github.com/yasershahi/silverblue/actions/workflows/build.yml/badge.svg)](https://github.com/yasershahi/silverblue/actions/workflows/build.yml)

# silverblue
> Update: I moved to [Arch Linux](https://github.com/yasershahi/archdaily) as my daily driver since oct 5, 2024!
This is my Fedora Silverblue Image. I daily drive this image on my main machine (ThinkPad X1 Extreme). You can fork it, customize and use it.
## Apps
### Flatpak
- AnyDesk
- Audacity
- Authenticator
- Brave Browser
- Dconf-editor
- Extension Manager
- Flatseal
- G4music
- GIMP
- Gnome Boxes
- Gradience
- HandBrake
- Inkscape
- KDEnlive
- LibreOffice
- Lunacy
- Motrix
- Mousai
- NewsFlash
- OBS-Studio
- Obsidian
- Parabolic
- PinApp
- Podcast
- Poedit
- Resources
- Sound Recorder
- Spotify
- Telegram
- Thunderbird
- VLC
- VSCode

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
- Intel media driver
- Nvidia drivers not included. Fist do [this](https://github.com/CheariX/silverblue-akmods-keys) then [this](https://github.com/fedora-silverblue/issue-tracker/issues/286) then:

    ```
    sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia-cuda nvidia-vaapi-driver libva-utils vdpauinfo
    ```
    ```
    rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1 initcall_blacklist=simpledrm_platform_driver_init
    ```

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
- Just Perfection

### Fonts
- Fira code
- Jetbrains mono
- [ubuntu Fonts](https://design.ubuntu.com/font)
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


