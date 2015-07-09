---
author: robmyers
comments: true
date: 2008-09-01 07:07:12+00:00
layout: post
slug: art_generators
title: art_generators
wordpress_id: 1661
categories:
- Free Culture
- Generative Art
- Projects
---

[http://github.com/robmyers/art_generators/tree/master](http://github.com/robmyers/art_generators/tree/master)  
  


<blockquote>_Rails-style generator system for creating and managing digital art projects._</blockquote>

  
  
Over the last few years I've developed a fairly standard directory layout and project lifecycle for my art image projects. If you download an archive from a project page at [/art](/art) you'll see there's a folder with the project's name containing a LICENSE file and directories named "final" and "discard". During the course of a project I make images and sort them into "final" for images I'll put on the web page and that should be considered part of the finished project and "discard" for images that don't make the grade.  
  
This can be automated to a degree, so inspired by Ruby On Rails I've created a system to create the directory layout and add scripts to move work between directories, bundle them up for release, and generate web pages to display the images.  
  
Currently the project is going under the terrible title of "art_generators". I really need a better title, something like Rails, so any suggestions will be gratefully received. Cerise, plinth and sketchbook are ideas so far.  
  
I'll bundle this up as a Ruby gem when it's ready for other people to use, but the project creation code works OK and interfaces with SVN. I'll be using it for a couple of projects to get the rest of the scripts working well, then I'll do an initial release.  


