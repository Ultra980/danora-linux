#!/bin/bash

zenity --list \
--title=Browser \
--column " " --column "Browser" --column "Package Name" --column "Install Command" --column "Install Method/Repository" --separator " & " --checklist --print-column=4 --width=545 --height=300 --text "Please select the browser(s) you want to install from the list below:" --hide-column=4 \
"TRUE" "Waterfox (Reccomended)" "N/A" "/usr/bin/install_waterfox" "Custom install script" \
"FALSE" "Firefox" "org.mozilla.firefox" "flatpak install org.mozilla.firefox" "Flatpak (flathub)" \
"FALSE" "Vivaldi" "vivaldi" "wget https://vivaldi.com/download/ | rpm-ostree install" "rpm-ostree" \
"FALSE" "Google Chromium" "org.chromium.Chromium" "flatpak install org.chromium.Chromium" "Flatpak (flathub)" \
"FALSE" "Ungoogled Chromium" "com.github.Eloston.UngoogledChromium" "flatpak install com.github.Eloston.UngoogledChromium" "Flatpak (flathub)"
