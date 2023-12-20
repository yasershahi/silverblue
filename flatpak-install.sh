#!/bin/bash

# List of flatpak apps to be installed
flatpaks=(
    "com.anydesk.Anydesk"
    "org.audacityteam.Audacity"
    "com.belmoussaoui.Authenticator"
    "ca.desrt.dconf-editor"
    "com.mattjakeman.ExtensionManager"
    "com.github.tchx84.Flatseal"
    "com.github.neithern.g4music"
    "org.gimp.GIMP"
    "org.gnome.Boxes"
    "com.github.GradienceTeam.Gradience"
    "fr.handbrake.ghb"
    "org.inkscape.Inkscape"
    "org.kde.kdenlive"
    "org.libreoffice.LibreOffice"
    "com.icons8.Lunacy"
    "net.agalwood.Motrix"
    "io.github.seadve.Mousai"
    "io.gitlab.news_flash.NewsFlash"
    "com.obsproject.Studio"
    "md.obsidian.Obsidian"
    "org.nickvision.tubeconverter"
    "io.github.fabrialberio.pinapp"
    "org.gnome.Podcasts"
    "net.poedit.Poedit"
    "net.nokyan.Resources"
    "org.gnome.SoundRecorder"    
    "com.spotify.Client"
    "org.telegram.desktop" 
    "org.mozilla.Thunderbird"
    "org.videolan.VLC"
    "com.visualstudio.code"
)

# Loop through the array and install the flatpak apps
for app in "${flatpaks[@]}"; do
    echo "Installing $app..."
    flatpak install -y flathub "$app"
    echo "----------------------------------"
done

echo "Flatpak installation complete!"
