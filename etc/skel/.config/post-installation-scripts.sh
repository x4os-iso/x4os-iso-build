#set OpenDesktop-Dark as default KDE Plasma Global Theme
sudo sed -i 's/LookAndFeelPackage=org.kde.breezetwilight-arcolinux.desktop/LookAndFeelPackage=OpenDesktop-Dark/g' /etc/skel/.config/kdeglobals

#set OpenDesktop-DarkIcons as default KDE Plasma Icon Theme
sudo sed -i 's/Theme=Surfn-Plasma-Dark/Theme=OpenDesktop-DarkIcons/g' /etc/skel/.config/kdeglobals

#set Qogir-dark style as Plasma style 
sudo sed -i 's/name=breeze-dark/name=Qogir-dark/g' /etc/skel/.config/plasmarc

#remove taskmanager (running application bottom bar section) with spacer (to keep the rest of bottom bar content on the right side)
sudo sed -i 's/plugin=org.kde.plasma.taskmanager/plugin=org.kde.plasma.panelspacer/g' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc
#remove kde.plasma.kicker (launcher) with (another) spacer
sudo sed -i 's/plugin=org.kde.plasma.kicker/plugin=org.kde.plasma.panelspacer/g' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc

#find and remove pager from bottom bar config
#find line number where pager is located
l2="$(grep -n "plugin=org.kde.plasma.pager" /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc | head -n 1 | cut -d: -f1)"
#calc and remove this line as well as the previous two lines
l1=$((l2-2))
sed -i.bak -e ${l1}','${l2}'d' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc 
