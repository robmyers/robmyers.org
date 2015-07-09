---
author: robmyers
comments: true
date: 2006-07-26 09:19:05+00:00
layout: post
slug: chordinator-in-sourceforge
title: Chordinator in Sourceforge
wordpress_id: 1059
categories:
- Generative Art
- Projects
---

  
[chordinator.lisp](http://rob-art.cvs.sourceforge.net/rob-art/rob-art/chordinator/chordinator.lisp?revision=1.1&view=markup)  


  
After some struggles with Sourceforge, the source code for chordinator is now available.  


  
Here's a sample:  

    
    (defmethod colour-generator (hue-fun saturation-fun brightness-fun)<br></br>"Make a function to make a new instance of colour."<br></br>(lambda ()<br></br>(make-instance 'colour<br></br>:hue (funcall hue-fun)<br></br>:saturation (funcall saturation-fun)<br></br>:brightness (funcall brightness-fun))))<br></br><br></br>(defmethod random-colour-generator (&key; (min-hue 0.0) (max-hue 1.0)<br></br>(min-saturation 0.0) (max-saturation 1.0)<br></br>(min-brightness 0.0) (max-brightness 1.0))<br></br>"Make a function to make a random colour."<br></br>(colour-generator (random-generator min-hue max-hue)<br></br>(random-generator min-saturation max-saturation)<br></br>(random-generator min-brightness max-brightness)))<br></br><br></br>(defmethod n-random-colours ((n integer) &key; (min-hue 0.0) (max-hue 1.0)<br></br>(min-saturation 0.0) (max-saturation 1.0)<br></br>(min-brightness 0.0) (max-brightness 1.0))<br></br>"Make a list of n random colours."<br></br>(let ((generate (random-colour-generator :min-hue min-hue<br></br>:max-hue max-hue<br></br>:min-saturation min-saturation<br></br>:max-saturation max-saturation<br></br>:min-brightness min-brightness<br></br>:max-brightness max-brightness)))<br></br>(loop repeat n<br></br>collect (funcall generate))))<br></br>

  


