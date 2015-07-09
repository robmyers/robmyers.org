---
author: robmyers
comments: true
date: 2007-12-08 08:13:50+00:00
layout: post
slug: setting-up-a-development-environment-for-common-lisp-minara
title: Setting Up A Development Environment For Common Lisp Minara
wordpress_id: 1540
categories:
- Generative Art
- Projects
---

**Install sbcl**  
  
sudo apt-get install sbcl  
  
**Install flexichain using asdf-install**  
  
sudo sbcl  
  
(require :asdf)  
(require :asdf-install)  
(asdf-install:install :flexichain)  
(quit)  
  
**Install cl-opengl from its darcs repository**  
  
cd ~/.sbcl  
mkdir site  
cd site  
darcs get http://common-lisp.net/project/cffi/darcs/cffi/  
darcs get http://www.common-lisp.net/project/cl-opengl/darcs/cl-opengl/  
cd ..  
mkdir systems  
cd systems  
ln -s ../site/cl-opengl/*asd .  
ln -s ../site/cffi/*asd .  
  
**Test loading the libraries**  
  
sbcl  
  
(require 'asdf)  
(asdf:operate 'asdf:load-op 'flexichain)  
(asdf:operate 'asdf:load-op 'cl-opengl)  


