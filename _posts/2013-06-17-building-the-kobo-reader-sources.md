---
author: robmyers
comments: true
date: 2013-06-17 00:01:12+00:00
layout: post
slug: building-the-kobo-reader-sources
title: Building The Kobo Reader Sources
wordpress_id: 2378
categories:
- Free Software
- Howto
---

I've covered this before, but the Kobo Reader sources have changed, so here's an updated guide to installing and building them.

Create the directory structure:

    
    cd
    mkdir kobo
    cd kobo
    mkdir fs
    mkdir tmp



Fetch the Kobo Reader sources:

    
    git clone git clone git://github.com/kobolabs/Kobo-Reader.git KoboLabs



Set bash as your shell (you can set it back afterwards using the same command):

    
    sudo dpkg-reconfigure -plow dash
    # Choose "No"



Install the developer tools:

    
    toolchains/gcc-codesourcery-2010q1-202.bin



If you're on a 64-bit version of the OS, make sure you install the i386 versions of libc6 and any other missing libraries for the installer or the tools (e.g. libXext).

Make symbolic links to the toolchain under the names that Qt's build system is expecting. Otherwise you will get weird and difficult to diagnose errors:


    
    cd ~/CodeSourcery/Sourcery_G++/bin
    for f in arm-none-linux-gnueabi-*; do n=$(echo $f|cut -b 24-); ln -s $f arm-linux-$n; done



Set required environment variables:

    
    echo "export KOBOLABS=$HOME/kobo/KoboLabs" >> ~/.bashrc
    echo "export PATH=$PATH:$HOME/CodeSourcery/Sourcery_CodeBench_Lite_for_ARM_GNU_Linux/bin" >> ~/.bashrc
    source ~/.bashrc



Create the file ~/kobo/KoboLabs/build/build-config-user.sh with the following contents:

    
    DEVICEROOT=$HOME/kobo/fs
    QT_EXTRA_ARGS="--prefix=$HOME/kobo/qt -DQT_NO_QWS_CURSOR -DQT_NO_QWS_QPF2"



Start the build:

    
    
    cd ~/kobo/tmp
    ~/kobo/KoboLabs/build/build-all.sh
    



And then wait...
