#!/bin/bash

# List of flatpak apps to be installed
flatpaks=(
    "com.icons8.Lunacy"
    "com.github.marhkb.Pods"
    "com.boxy_svg.BoxySVG"
    "io.github.jliljebl.Flowblade"
    "org.bunkus.mkvtoolnix-gui"
    "md.obsidian.Obsidian"
    "org.gimp.GIMP"
    "org.inkscape.Inkscape"
    "com.github.huluti.Curtail"
    "com.spotify.Client"
    "com.github.neithern.g4music"
    "org.gnome.Podcasts"
    "org.gnome.SoundRecorder"
    "io.gitlab.news_flash.NewsFlash"
    "org.telegram.desktop"
    "com.discordapp.Discord"
    "im.riot.Riot"
    "org.mozilla.Thunderbird"
    "org.videolan.VLC"
    "org.jellyfin.JellyfinServer"
    "org.nickvision.tubeconverter"
    "org.libreoffice.LibreOffice"
    "com.github.tchx84.Flatseal"
    "net.poedit.Poedit"
    "com.belmoussaoui.Authenticator"
    "io.github.fabrialberio.pinapp"
    "org.localsend.localsend_app"
    "io.github.seadve.Mousai"
    "org.gnome.Boxes"
    # Add more flatpak apps here
)

# Loop through the array and install the flatpak apps
for app in "${flatpaks[@]}"; do
    echo "Installing $app..."
    flatpak install -y flathub "$app"
    echo "----------------------------------"
done

echo "Flatpak installation complete!"
