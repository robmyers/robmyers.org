---
author: robmyers
comments: true
date: 2012-09-13 19:24:54+00:00
layout: post
slug: connecting-to-lambdamoo-from-desktop-and-laptop-computers
title: Connecting To LambdaMOO From Desktop And Laptop Computers
wordpress_id: 2060
categories:
- LambdaMOO
---

LambdaMOO uses the Telnet protocol but modern operating systems don't tend to include a Telnet client by default. Using a dedicated MOO client offers a much better experience, so we'll concentrate on finding and installing one of those instead.



## GNU/Linux



GnomeMUD is a MOO client for GNU/Linux. It is usually available through your package manager as gnome-mud.

Use the following World Settings for LambdaMOO:

**Host:** lambda.moo.mud.org

**Port:** 8888

**Logon: **connect Guest

or, once you register a character

**Logon: **connect CHARACTER PASSWORD

Replace "CHARACTER" with the name of your character, and "PASSWORD" with your password.



## Windows



Pueblo is a MOO client for Windows. You can download it [here](http://pueblo.sourceforge.net/pueblo/).

Use the following World Settings for LambdaMOO:

**Host:** lambda.moo.mud.org

**Port:** 8888

**Username: **Guest

Leave the password blank.

or, once you register a character

**Username: **CHARACTER

**Password: **PASSWORD

Replace "CHARACTER" with the name of your character, and "PASSWORD" with your password.



## Mac OS X



Savitar is a MOO client for Mac OS X. You can download it [here](http://www.heynow.com/savitar/).

Use the following World Settings for LambdaMOO:

**Host Name:** lambda.moo.mud.org

**Host Port:** 8888

**Issue these commands at startup: **connect Guest

or, once you register a character

**Issue these commands at startup: **connect CHARACTER PASSWORD

Replace "CHARACTER" with the name of your character, and "PASSWORD" with your password.



## Cross-Platform GUI client



Mudlet is a graphical user interface MOO client that is available for GNU/Linux, MacOS X and Windows.  You can download it [here](http://www.mudlet.org/download/).

Use the following Connect settings for LambdaMOO:

**Server Address:** lambda.moo.mud.org

**Port:** 8888

Then click the connect button and once the welcome message from LambdaMOO finishes printing type :


    
        connect Guest



or, once you register a character:


    
        connect CHARACTER PASSWORD



Replace "CHARACTER" with the name of your character, and "PASSWORD" with your password.



## Cross-Platform Command Line Client



[TinyFugue 5](http://tinyfugue.sourceforge.net/) is a command-line MOO client that runs on MacOS X and Windows as well as on UNIX platforms such as GNU/Linux. It is usually available through your package manager as "tf5".

TinyFugue uses a command-line terminal window, so open a terminal and type:


    
        tf5



then when TinyFugue has loaded, type:


    
        /connect lambda.moo.mud.org 8888



and once the welcome message from LambdaMOO finishes printing, type :


    
        connect Guest



or, once you register a character:


    
        connect CHARACTER PASSWORD



Replace "CHARACTER" with the name of your character, and "PASSWORD" with your password.
