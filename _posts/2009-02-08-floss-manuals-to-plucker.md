---
author: robmyers
comments: true
date: 2009-02-08 23:17:52+00:00
layout: post
slug: floss-manuals-to-plucker
title: FLOSS Manuals To Plucker
wordpress_id: 1720
categories:
- Art Computing
- Free Culture
- Howto
- links
---

<br></br>#!/bin/bash<br></br># Copyright 2009 Rob Myers <rob@robmyers.org><br></br># Licenced under the GPL version 3 or, at your option, any later version.<br></br><br></br>if [ "$1" == "" ]; then<br></br>   echo "Please enter name of manual directory on server (e.g. FlossManuals)."<br></br>   echo "You can find this by going to the printable version of the manual."<br></br>   exit 1;<br></br>fi<br></br><br></br>plucker-build --zlib-compression --stayonhost --bpp=8 -p . \<br></br>  -f $1 --staybelow=http://en.flossmanuals.net/floss/pub/$1/ \<br></br>  http://en.flossmanuals.net/$1/print<br></br>



