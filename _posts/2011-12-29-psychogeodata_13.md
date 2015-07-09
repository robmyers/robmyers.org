---
author: robmyers
comments: true
date: 2011-12-29 19:28:45+00:00
layout: post
slug: psychogeodata_13
title: Psychogeodata (1/3)
wordpress_id: 1972
categories:
- Aesthetics
- Free Culture
- Generative Art
- Projects
- Satire
---

![derive](/assets/2011/12/29/derive.png)

**tl;dr** Psychogeographic Geodata using OpenStreetMap in Python. [Download here](https://gitorious.org/robmyers/psychogeodata).




[Psychogeography](https://en.wikipedia.org/wiki/Psychogeography) is a set of techniques for defamiliarizing the landscape, particularly the urban landscape. It is a way of resisting and critiquing the historically, culturally and politically imposed reality of the built environment. Starting with [Guy Debord](https://en.wikipedia.org/wiki/Guy_Debord), psychogeography has since followed the rest of the [Situationist](https://en.wikipedia.org/wiki/Situationist_International)'s techniques in being recuperated by society. But as Christine Harold points out in ["Ourspace"](http://www.upress.umn.edu/book-division/books/ourspace), this can be redressed by intensifying the strategies of Situationism into new forms.




The town and tube maps used by previous psychogeographers have been replaced in modern experiences of the landscape by [Geodata](https://en.wikipedia.org/wiki/Geodata), a mesh of points joined by the lines of streets and accompanied by tagged information describing them for human and machine use. Combining Psychogeography and Geodata gives us Psychogeodata.

![derive_degree](/assets/2011/12/29/derive_degree.png)




Geodata is tied to the logic of Googlization, of making the world rational and tractable for machines within the economy. Its positioning between commerce and consumer makes it ideal raw material for Situationist-inspired ironization. And Geodata, like other forms of information, can be made free. [OpenStreetMap](http://www.openstreetmap.org/) is a very successful project that does so. 




Taking the inhuman logic of Geodata as the basis for Psychogeography allows us to use [Graph Theory](https://en.wikipedia.org/wiki/Graph_theory) to examine the landscape mathematically. Graph Theory is also used in [Social Network Analysis](https://en.wikipedia.org/wiki/Social_network_analysis), and in discussions of the topology of the internet. It is a powerful mathematical abstraction.




The randomness, unfamiliarity and conceptual slippage that this provides us with can intensify historical strategies of [Dérive](https://en.wikipedia.org/wiki/D%C3%A9rive). In order to do so we need Geodata (from OSM) and software to manipulate and present it. The software that I have written for Psychogeodata is in the [Python](Python%20-%20http://python.org/) programming language. It operates on graphs using the [http://networkx.lanl.gov/](NetworkX) library. And the output is rendered using the  [OpenLayers](http://openlayers.org/) Javascript library.

![derive_loop](/assets/2011/12/29/derive_loop.png)




The first scripts written using the Psychogeodata library concentrate on the mathematics of graph theory. Click on the name of each script to open an example of its output in a new tab or window (which your browser's popup blocker may warn you about):




_(**Disclaimer:** This software currently generates paths that may or may not be safe or practical to actually follow. Use your discretion and common sense in choosing which ones to actually travel.)_




[derive](/psychogeodata/derive_example.html) - Generates random walks and non-self-intersecting random walks.




[derive_degree](/psychogeodata/derive_degree_example.html) - Generates journeys between high-and-low-connectivity nodes.




[derive_loop](/psychogeodata/derive_loop_example.html) - Generates circuitous journeys based on cycle bases




[derive_tags](/psychogeodata/derive_tag_example.html) - Generates paths between nodes with particular tags.




![derive_tags](/assets/2011/12/29/derive_tags.png)

To download the software and for more information, see:




[https://gitorious.org/robmyers/psychogeodata](https://gitorious.org/robmyers/psychogeodata)




(Part two of this series will present some scripts based on semantics, part three will cover potential future directions for Psychogeodata.)



