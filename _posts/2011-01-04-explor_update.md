---
author: robmyers
comments: true
date: 2011-01-04 23:27:44+00:00
layout: post
slug: explor_update
title: Explor Update
wordpress_id: 1911
categories:
- Art
- Art Computing
- Art History
---

![example6.png](/assets/2011/01/04/example6.png)I have updated my Explor compiler.  
  
The new version uses a shared library for the Explor functions, and cats the source file to the Fortran compiler along with a file that contains the "END" command rather than creating an intermediate file.  
  
You'll need git, autotools, libtool and g77 installed. On Fedora the command to install them is something like:  
  
su -c "yum install git gcc-gfortran libtool autoconf automake"  
  
Fetch the source code:  
  

git clone /git/explor.git  
  
Set up the build environment:  
  
cd explor  
./bootstrap  
  
Build:  
  
./configure  
make  
  
And install:  
  
su -c "make install"  
  
You can then make a test image:  
  
cd examples  
explor example6.explor  
  
This will print messages something like this:  
  
Compiling example6.explor to example6  
Running example6 with output to example6.ps  
  
And if you open the resulting .ps file, you'll see the image at the top of this post.  
  


