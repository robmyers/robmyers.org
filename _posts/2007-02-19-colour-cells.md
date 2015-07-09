---
author: robmyers
comments: true
date: 2007-02-19 02:54:12+00:00
layout: post
slug: colour-cells
title: Colour Cells
wordpress_id: 1229
categories:
- Aesthetics
- Generative Art
- Projects
- Sketchblog
---

Randomly coloured grids from colour-cells, my standalone re-implementation of AARON's new colouring algorithm as described by Harold Cohen.  
  
![drawing-20070218-170115.png](/wp-content/uploads/2007/02/drawing-20070218-170115.png)  
  
![drawing-20070218-170129.png](/wp-content/uploads/2007/02/drawing-20070218-170129.png)  
  
![drawing-20070218-170139.png](/wp-content/uploads/2007/02/drawing-20070218-170139.png)  
  
![drawing-20070218-172525.png](/wp-content/uploads/2007/02/drawing-20070218-172525.png)  
Here's an example of the debugging output of a run:  
  
CL-USER> (colour-cells:run)  
Starting colour-cells.  
sv-spec: (7 'MH 8 'HH)  
Colour Scheme:  
hues:  
LEAF 0.17177725 VEIN 0.43423924 BLADE 0.54956645 BRANCH 0.7650679 FLOWER 0.9934292 TENDRIL 0.13626313 BACKGROUND 0.21447933  
saturations:  
low: 0.22091965 0.10087495 0.2973811  
medium: 0.35810804 0.56012416  
high: 0.82899094 0.6722238  
values:  
low: 0.25903606  
medium: 0.47757912 0.48717552 0.36317036  
high: 0.8511361 0.8175543 0.7354897  
Colouring forms.  
MH 3 0.467 0.600 -0.133  
HH 1 0.533 0.200 0.333  
HH  
MH 4 0.467 0.400 0.067  
HH 5 0.533 0.500 0.033  
MH  
MH 7 0.467 0.467 0.000  
HH 7 0.533 0.467 0.067  
HH  
MH 9 0.467 0.450 0.017  
HH 10 0.533 0.500 0.033  
HH  
MH 9 0.467 0.360 0.107  
HH 15 0.533 0.600 -0.067  
MH  
MH 12 0.467 0.400 0.067  
HH 17 0.533 0.567 -0.033  
MH  
MH 13 0.467 0.371 0.095  
HH 21 0.533 0.600 -0.067  
MH  
MH 14 0.467 0.350 0.117  
HH 25 0.533 0.625 -0.092  
MH  
MH 17 0.467 0.378 0.089  
HH 27 0.533 0.600 -0.067  
MH  
MH 20 0.467 0.400 0.067  
HH 29 0.533 0.580 -0.047  
MH  
MH 23 0.467 0.418 0.048  
HH 31 0.533 0.564 -0.030  
MH  
MH 26 0.467 0.433 0.033  
HH 33 0.533 0.550 -0.017  
MH  
MH 28 0.467 0.431 0.036  
HH 36 0.533 0.554 -0.021  
MH  
MH 32 0.467 0.457 0.010  
HH 37 0.533 0.529 0.005  
MH  
#  
CL-USER>  


