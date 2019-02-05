#!/bin/sh
BoolS=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player PlaybackStatus)
BoolC=$(qdbus org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player PlaybackStatus)

if [ "$BoolS" = 'Playing' ];
 then
  echo $(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Metadata | awk '/xesam:title:/ { print}' | sed -e "s/^xesam:title://")
elif [ "$BoolC" = 'Playing' ];
 then
  echo $(qdbus org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Metadata | awk '/xesam:title:/ { print}' | sed -e "s/^xesam:title://")
fi
