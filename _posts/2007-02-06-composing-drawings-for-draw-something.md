---
author: robmyers
comments: true
date: 2007-02-06 07:41:55+00:00
layout: post
slug: composing-drawings-for-draw-something
title: composing drawings for draw-something
wordpress_id: 1223
categories:
- Generative Art
- Projects
---

**Stage One **  
  
1. Generate a number of points within the image bounding box.  
2. Force some points to be on the bounds.  
Modify the current figure form generation system to choose from these points.  
  
**Stage Two**  
  
3. Generate lines by joining the points.  
Modify the figure form generation system to choose from these lines.  
  
**Stage Three**  
  
4. Subdivide some of the lines.  
5. Split some of the overlapping lines.  
  
Alternatively create the hull or polygon for the figure and generate forms within it using points on the border, lines between them, and various subdivisions.  
  
**Stage Four**  
  
Implement various algorithms for consuming the lines and points. From back to front, most simplifying to most simple:  
  
Voronoi or region growing. (Use a flat coloured plane sometimes.  
Convex hull.  
  
Closed polygon.  
  
Open polygon.  
  
Line set.  
  
Polyline.  
  
Line.  
  
Point.  
  
Don't use every technique in every drawing. Increase tightness of line following from back to front. Colour by plane.  


