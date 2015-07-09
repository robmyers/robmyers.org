---
author: robmyers
comments: true
date: 2011-04-14 21:47:01+00:00
layout: post
slug: logging_colours_to_thingspeak
title: Logging Colours To ThingSpeak
wordpress_id: 1932
categories:
- Aesthetics
- Art Computing
- Art Open Data
- Free Software
- Howto
- Projects
---

[ThingSpeak](https://thingspeak.com/) is a Free Software-based web service for publishing (geolocated) data. This makes it better than proprietary services for publishing data.  
  
Using it is very easy, as [this tutorial](http://www.australianrobotics.com.au/?q=node/292) demonstrates. here's some code I've written in the Python programming language to grab a palette of 8 colours from a webcam image of my studio every 10 minutes and publish it to a ThingSpeak "Channel":  
  
[/git/?p=thingspeak.git](/git/?p=thingspeak.git)  
  
And here's the resulting data, in JSON format:  
  
[http://api.thingspeak.com/channels/357/feed.json](http://api.thingspeak.com/channels/357/feed.json)  
  
**Update [17th April 2011]**  
  
Thanks to ThingSpeak suggesting it, here's a jQuery display of the colours:  
  
[/git/?p=thingspeak.git;a=blob_plain;f=studio_colours.html](/git/?p=thingspeak.git;a=blob_plain;f=studio_colours.html)  
  
It starts with the 100 most recent palettes, and adds them every 10 minutes as more are uploaded.  


