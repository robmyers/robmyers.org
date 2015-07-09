---
author: robmyers
comments: true
date: 2008-11-29 05:40:49+00:00
layout: post
slug: wacom-xorgconf-for-lenny-laptop
title: Wacom xorg.conf For Lenny Laptop
wordpress_id: 1696
categories:
- Art Computing
- Howto
---

# This may be useful to someone else  
  
Section "InputDevice"  
Identifier "Generic Keyboard"  
Driver "kbd"  
Option "XkbRules" "xorg"  
Option "XkbModel" "pc105"  
Option "XkbLayout" "gb"  
EndSection  
  
Section "InputDevice"  
Identifier "Configured Mouse"  
Driver "mouse"  
EndSection  
  
Section "Device"  
Identifier "Configured Video Device"  
EndSection  
  
Section "Monitor"  
Identifier "Configured Monitor"  
EndSection  
  
Section "Screen"  
Identifier "Default Screen"  
Monitor "Configured Monitor"  
EndSection  
  
Section "InputDevice"  
Driver "wacom"  
Identifier "stylus"  
Option "Device" "/dev/input/wacom"  
Option "Type" "stylus"  
Option "USB" "on"  
EndSection  
  
Section "InputDevice"  
Driver "wacom"  
Identifier "eraser"  
Option "Device" "/dev/input/wacom"  
Option "Type" "eraser"  
Option "USB" "on"  
EndSection  
  
Section "InputDevice"  
Driver "wacom"  
Identifier "cursor"  
Option "Device" "/dev/input/wacom"  
Option "Type" "cursor"  
Option "USB" "on"  
EndSection  
  
Section "InputDevice"  
Driver "wacom"  
Identifier "pad"  
Option "Device" "/dev/input/wacom"  
Option "Type" "pad"  
Option "USB" "on"  
EndSection  
Section "ServerLayout"  
Identifier "Default Layout"  
Screen 0 "Default Screen" 0 0  
InputDevice "Configured Mouse" "CorePointer"  
InputDevice "Generic Keyboard" "CoreKeyboard"  
InputDevice "stylus" "SendCoreEvents"  
InputDevice "eraser" "SendCoreEvents"  
InputDevice "cursor" "SendCoreEvents" # For non-LCD tablets only  
# InputDevice "touch" "SendCoreEvents" # Only a few TabletPCs support this type  
InputDevice "pad" # For Intuos3/CintiqV5/Graphire4/Bamboo tablets  
EndSection  
  
  


