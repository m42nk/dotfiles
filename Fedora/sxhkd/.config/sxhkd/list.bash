#!/bin/env bash

LIST=(
ActivityManager
Alacritty_desktop
KDE_Keyboard_Layout_Switcher
google_chrome_desktop
kaccess
kalarm
kcm_touchpad
kded5
khotkeys
kmix
ksmserver
kwin
mediacontrol
org_kde_dolphin_desktop
org_kde_konsole_desktop
org_kde_krunner_desktop
org_kde_plasma_emojier_desktop
org_kde_powerdevil
org_kde_spectacle_desktop
plasmashell
systemsettings_desktop
yakuake
)

for i in "${LIST[@]}"; do
	echo "-- $i"
	qdbus org.kde.kglobalaccel /component/$i org.kde.kglobalaccel.Component.shortcutNames
	echo -e "\n"
done

