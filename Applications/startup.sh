#Introduce Delay
sleep 2

#Set Background Colours
wal -R

#Start Background
#xwinwrap -ov -ni -fs -- mpv -vo x11 -wid WID --keepaspect=no --loop ~/Desktop/Background.gif &

#Start MPD (Music Player Server)
mpd &

#Start Compton (Composition Manager That Lets Me Have Transparency In Windows)
compton -b --config ~/.config/compton.conf

#Dunst (Notification Service)
dunst -conf ~/.config/dunst &

#Keynav
keynav &

#Polybar (Bar At The Top)
sh ~/.config/polybar/launch.sh

#Glava Visualizer
#glava --desktop
