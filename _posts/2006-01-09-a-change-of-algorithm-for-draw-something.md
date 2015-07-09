---
author: robmyers
comments: true
date: 2006-01-09 05:28:16+00:00
layout: post
slug: a-change-of-algorithm-for-draw-something
title: A Change Of Algorithm For draw-something
wordpress_id: 776
categories:
- Generative Art
- Projects
---

I changed the way that figure bounds were decided, and started varying the size of the drawing as well. This has made draw-something's output more how I want it to look. But it's disturbing that random images look this good. I'm reminded of Harold Cohen's comments regarding AARON about the (un)importance of composition in aesthetics.  
  
The program is "chatty" again, describing what it does. It saves images under a unique filename (so I don't lose development images), and it opens the results in Preview.app on OpenMCL. Here's what you see on the command line:  

    
    $ openmcl -l run.lisp<br></br>Starting draw-something.<br></br>Generating 5 figure skeletons: 1 2 3 4 5.<br></br>Drawing 5 figure outlines: 1 2 3 4 5.<br></br>Writing drawing to file ./drawings/drawing-20060108-172815.eps .<br></br>Finished draw-something.

  
Here's some of the results:  
  
![Drawing-20060108-172501](/wp-content/drawing-20060108-172501.jpg)  
  
![Drawing-20060108-172546](/wp-content/drawing-20060108-172546.jpg)  
  
![Drawing-20060108-172815](/wp-content/drawing-20060108-172815.jpg)  
  
Note to self: vary the potential min/max of figure bounds rectangle sizes. The previous images (draw-something In Development) used the same potential bounds for figures as the image bounds. And they looked interesting in their own way. So make sure they can happen.  
  
  


Technorati Tags: [aesthetics](http://www.technorati.com/tag/aesthetics), [art](http://www.technorati.com/tag/art), [generative art](http://www.technorati.com/tag/generative%20art), [lisp](http://www.technorati.com/tag/lisp)

  
  


