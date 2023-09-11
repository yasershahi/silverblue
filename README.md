[![build-image](https://github.com/yasershahi/silverblue/actions/workflows/build.yml/badge.svg)](https://github.com/yasershahi/silverblue/actions/workflows/build.yml)

# silverblue
This is my Fedora Silverblue Image.

## What I do with my system
Apps with **bold** names will be installed as **Flatpaks**

### UI/UX Design
- **Lunacy**
- **Boxysvg**
- [Figma font agent](https://github.com/neetly/figma-agent-linux)

### Development
- VScode
- python3-pip
- **Pods**
- nss-tools
- mkcert
- podman-compose
- podman-docker
- wireguard-tools
- tailscale
- cosign
- **Poedit**

### Edit videos
- **Flowbite**
- **MKVToolsnix**

### Take notes
- **Obsidian**

### Edit photos & graphics
- **GIMP**
- **Inkscape**
- **Curtail**

### Listen to music
- **Spotify**
- spotdl
- **G4music**
- **Podcasts**

### Recording
- **sound recorder**

### Read news / surf web
- Firefox
- **newsflash**

### Communicate
- **Telegram**
- **Discord**
- **Element**
- **Thunderbird**

### Watch Movies
- **VLC**
- **Jellyfin Server**

### Work with documents
- **LibreOffice**

### Download files
- aria2
- XDM (not included yet)
- **Parabolic**
- yt-dlp

## Ease of life
- **Authenticator**
- codecs
- unrar
- btop
- lm_sensors
- neofetch
- cmatrix
- xfburn
- **Flatseal**
- **PinApp**

## Desktop
I use GNOME as Fedora offers but with some modifications:
### deleted from gnome stock
- **gnome-maps**
- **gnome-weather**
- gnome-tour
- **gnome-photos**
- **gnome-music**
- gnome-classic-session

### optimizing
- mutter-patched for smoother animations
- Better font rendering
- Increase priority of Flathub repository
- Replace Fedora's Flatpaks with the ones from Flathub
- Remove unused Flatpak dependencies automatically
- Set automatic checking of updates for the system
- Reduce systemd shutdown timers

### Settings
- enable tap to click
- make curser bigger
- disable automatic suspend
- disable unnecessary search
- disable file history
- automatic empty trash in 7 days

### Fonts included
- Inter
- Vazirmatn
- Vazir code
- Sahel
- Gandom
- Tanha
- Nahid
- Parastoo
- Samim
- Shabnam
- Mikhak
- Estedad

### Repositories included
- RPMfution
- mutter-patched
- tailscale
- vscode

### Customization
- [Firefox gnome theme](https://github.com/rafaelmardojai/firefox-gnome-theme)
- [VScode adwaita theme](https://marketplace.visualstudio.com/items?itemName=piousdeer.adwaita-theme)
- [Thunderbird gnome theme](https://github.com/rafaelmardojai/thunderbird-gnome-theme)
- [Telegram libadwaita theme](https://github.com/Fenimoure/Telegram-Adwaita-Dark-theme)

## Installation
After installing Fedora Silverblue, rebase with this command:

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/yasershahi/silverblue:latest

These images are signed with Sisgstore's Cosign. You can verify the
signature by downloading the `cosign.pub` key from this repo and running the
following command:

    cosign verify --key cosign.pub ghcr.io/yasershahi/silverblue

## Known issues
* Nvidia drivers not included
* Flatpaks manual installation process
* Signing

## Thank You 
All credits goes to these projects:
[Bluefin](https://github.com/ublue-os/bluefin), 
[ublue-os](https://github.com/ublue-os/main), 
[BlueFusion](https://github.com/aguslr/bluefusion), 
[BlueVanilla](https://github.com/aguslr/bluevanilla), 
[awesome-custom-images](https://github.com/ublue-os/awesome-custom-images)


