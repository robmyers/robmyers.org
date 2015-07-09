---
author: robmyers
comments: true
date: 2010-05-23 19:14:02+00:00
layout: post
slug: using_a_3_wireless_broadband_usb_stick_under_fedora
title: Using a 3 Wireless Broadband USB Stick Under Fedora
wordpress_id: 1841
categories:
- Free Software
- Howto
---

I bought a 3 Wireless Broadband USB Stick to use with my Fedora subnotebook.

  


Installing it was about as painful as installing a WiFi adapter a few years ago.

  


Install modeswitch to switch the usb stick to broadband mode (I think) -

  


su -c 'yum install usb_modeswitch usb_modeswitch-data'

  


Reboot (I think).

  


Plug in the wireless broadband stick.

  


Configure the wireless broadband connection using Network Manager or System/Preferences/Network Connections

  
Select 'enable wireless broadband' from the network manager right-click menu.

  


Connect to 3's web site to register and get sent your password by SMS.

  


Install gammu to get the text message containing the password -

  


su -c 'yum install gammu'

dmesg | grep tty

gammu-config

su -c 'chmod +rw /dev/ttyUSB2'

gammu getallsms

  


Use the password to complete online registration and you're ready to go.



