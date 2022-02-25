#set OpenDesktop-Dark as default KDE Plasma Global Theme
sed -i 's/LookAndFeelPackage=org.kde.breezetwilight-arcolinux.desktop/LookAndFeelPackage=OpenDesktop-Dark/g' /etc/skel/.config/kdeglobals

#set OpenDesktop-DarkIcons as default KDE Plasma Icon Theme
sed -i 's/Theme=Surfn-Plasma-Dark/Theme=OpenDesktop-DarkIcons/g' /etc/skel/.config/kdeglobals

#set Qogir-dark style as Plasma style 
sed -i 's/name=breeze-dark/name=Qogir-dark/g' /etc/skel/.config/plasmarc

#remove taskmanager (running application bottom bar section) with spacer (to keep the rest of bottom bar content on the right side)
sed -i 's/plugin=org.kde.plasma.taskmanager/plugin=org.kde.plasma.panelspacer/g' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc
#remove kde.plasma.kicker (launcher) with (another) spacer
sed -i 's/plugin=org.kde.plasma.kicker/plugin=org.kde.plasma.panelspacer/g' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc

#find and remove pager from bottom bar config
#find line number where pager is located
l2="$(grep -n "plugin=org.kde.plasma.pager" /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc | head -n 1 | cut -d: -f1)"
#calc and remove this line as well as the previous two lines
l1=$((l2-2))
sed -i.bak -e ${l1}','${l2}'d' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc 

#change default background
l1="$(grep -n "Wallpaper" /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc | head -n 1 | cut -d: -f1)"
l2=$((l1+1))
sed -i.bak -e ${l2}'d' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc
sed -i.bak -e ${l2}'i Image=file:///etc/skel/.local/share/wallpapers/beach-mi-pad-5-pro-aerial-view-drone-photo-seashore-winter-3840x3840-6511.jpg' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc

l1="$(grep -n "Wallpaper" /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc | tail -n 1 | cut -d: -f1)"
l2=$((l1+1))
sed -i.bak -e ${l2}'d' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc
sed -i.bak -e ${l2}'i Image=file:///etc/skel/.local/share/wallpapers/beach-mi-pad-5-pro-aerial-view-drone-photo-seashore-winter-3840x3840-6511.jpg' /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc

########################## enable Plasma Overview effect and map it to 'Meta + Tab' ##########################################################################
#find row for insertion
l1="$(grep -n "wobblywindowsEnabled" /etc/skel/.config/kwinrc | head -n 1 | cut -d: -f1)"
l2=$((l1+1))
sed -i.bak -e ${l2}'i overviewEnabled=true' /etc/skel/.config/kwinrc

#find row for insertion
l1="$(grep -n "MoveZoomUp" /etc/skel/.config/kglobalshortcutsrc | head -n 1 | cut -d: -f1)"
l2=$((l1+1))
sed -i.bak -e ${l2}'i Overview=Meta+Tab,Meta+W,Toggle Overview' /etc/skel/.config/kglobalshortcutsrc
sed -i.bak -i 's/next activity=Meta+Tab,none,Walk through activities/next activity=none,Meta+Tab,Walk through activities/g' /etc/skel/.config/kglobalshortcutsrc
##############################################################################################################################################################
