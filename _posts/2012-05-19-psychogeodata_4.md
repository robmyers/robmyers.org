---
author: robmyers
comments: true
date: 2012-05-19 21:11:02+00:00
layout: post
slug: psychogeodata_4
title: Psychogeodata 4
wordpress_id: 1990
categories:
- Free Software
- Projects
---

![derive_amenity](/assets/derive_amenity.png)I've added a new script to psychogeodata: derive_amenities.  
  
This creates a path between one or more nodes with a given amenity tag, for example restaurants:  
  
rob@laptop:~/projects/psychogeodata$ ./derive_amenities restaurant test.osm   
Loaded test.osm. Amenity ['restaurant']: [u'915945516', u'915945586', u'459487338', u'915945925', u'915945684'].  
Wrote derive to 20120519-210356.html  
  


