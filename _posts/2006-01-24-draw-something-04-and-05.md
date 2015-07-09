---
author: robmyers
comments: true
date: 2006-01-24 05:34:19+00:00
layout: post
slug: draw-something-04-and-05
title: draw-something 0.4 and 0.5
wordpress_id: 804
categories:
- Generative Art
- Projects
---

  
_draw-something 0.4_ will draw on a number of classic AI applications for its structure whilst building on the existing code and drawing style.  


  
**AARON**  


  
_Harold Cohen_, Tate Gallery, 1983, ISBN 0905005392  


  
The drawing will consist of a series of figures, as it does now. Each figure will consist of more than one form, which has an outline and a fill. The outlines and fills of each form may touch other forms, and so not every outline will go all the way around each form. This is the equivalent of the linked lists of figures, developments and lines (each line consisting of a number of points) described in the Tate catalogue.  


  
_The First Artificial Intelligence Colouring Book_, 1984, ISBN 0865760608  


  
To help allocate space for figures in the drawing, draw-something will use a coarse grid of cells superimposed over the co-ordinates of the drawing, as described in "The First Artificial Intelligence Colouring Book" and elsewhere. As figures are generated, cells will be marked as belonging to each figure. This will allow fast location of space for new figures, and fast location of figures to overlap.  


  
**copycat**  


  
_Fluid Concepts And Creative Analogies_, 1995, ISBN 0465051545  


  
[http://www.cs.pdx.edu/~mm/how-to-get-copycat.html](http://www.cs.pdx.edu/~mm/how-to-get-copycat.html)  


  
Like AARON, copycat is a probabilistic rules system with a knowledgebase that constructs aesthetic structures. But copycat structures its rules as "codelets" and its knowledgebase is a kind of semantic network that allows generalisation, a "slipnet". draw-something's rules will be structured as codelets, initially just simple codelets that re-implement the current drawing system.  


  
_draw-something 0.5_ will add more codelets and implement a kind of slipnet about pictorial and spatial construction. This is inspired by SHRDLU, which may also have influenced the "block world" version of AARON.  


  
**SHRDLU**  


  
[http://hci.stanford.edu/~winograd/shrdlu/](http://hci.stanford.edu/~winograd/shrdlu/)  


  
The interesting part of SHRDLU for draw-something is not its natural language processing but its spatial knowledge: SHRDLU knows how objects can interact and will not allow impossible interactions. draw-something will use a copycat-style series of codelets to identify properties of figures being constructed, and a SHRDLU-style knowledgebase to decide how they can go together.  


  


Technorati Tags: [artificial intelligence](http://www.technorati.com/tag/artificial intelligence), [generative art](http://www.technorati.com/tag/generative art)

  


