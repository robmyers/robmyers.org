---
author: robmyers
comments: true
date: 2011-09-18 20:14:00+00:00
layout: post
slug: imageplot_and_properties-plotr
title: ImagePlot and properties-plot.r
wordpress_id: 1947
categories:
- Art Computing
- Art Open Data
- Projects
---

ImagePlot is out:  
  
[http://lab.softwarestudies.com/2011/09/introducing-imageplot-software-explore.html](http://lab.softwarestudies.com/2011/09/introducing-imageplot-software-explore.html)  
  
It's a JImage macro that plots visualizations of image statistics using the images themselves. It's very cool, do take a look. As well as the complete software under the GPL (but version 2 only???) it has sample data, and essays explaining the project. There are some great examples of visualizations created using the system at the link above.  
  
As what will be the basis of the next posts in my "Exploring Art Data" series, I've implemented a simpler version of ImagePlot in R over the weekend. The code to extract image data has been wrapped up as a command-line tool, the code to produce the final visualizations hasn't.  
  
You can get my code here in the image-analysis folder (it's GPLv3 or later):  
  
[https://gitorious.org/robmyers/art-data/  
  
](https://gitorious.org/robmyers/art-data/)Here's an example plot using the Mondrian images from ImagePlot's sample folder:  
  
[![Mondrian Visualization](/assets_c/2011/09/r_image-thumb-400x313-57.png)](/assets_c/2011/09/r_image-57.html)You can create PDF and PNG files as well as view the results onscreen. I want to tweak the display parameters and tidy up a few lines in the code then make a command-line interface for it. And maybe even a GUI interface...  


  




