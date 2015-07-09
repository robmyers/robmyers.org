---
author: robmyers
comments: true
date: 2011-12-31 13:02:51+00:00
layout: post
slug: psychogeodata_33
title: Psychogeodata (3/3)
wordpress_id: 1974
categories:
- Aesthetics
- Art
- Art Computing
- Art History
- Free Culture
- Free Software
- Generative Art
- Howto
- Projects
- Satire
---

![cemetary random walk](/assets/2011/12/31/cemetary_random_walk.png)

The examples of Psychogeodata given so far have used properties of the geodata graph and of street names to guide generation of [Dérive](https://en.wikipedia.org/wiki/D%C3%A9rive). There are many more ways that Psychogeodata can be processed, some as simple as those already discussed, some much more complex.




## General Strategies




There are some general strategies that most of the following techniques can be used as part of. 






  * Joining the two highest or lowest examples of a particular measure.



  * Joining the longest run of the highest or lowest examples of a particular measure.



  * Joining a series of destination [waypoints](https://en.wikipedia.org/wiki/Waypoint) chosen using a particular measure.





The paths constructed using these strategies can also be forced to be non-intersecting, and/or the waypoints re-ordered to find the shortest journey between them.




## Mathematics




Other mathematical properties of graphs can produce interesting walks. The length of edges or ways can be used to find sequences of long or short distances.




Machine learning techniques, such as [clustering](https://en.wikipedia.org/wiki/Cluster_analysis), can arrange nodes spatially or semantically.




Simple left/right choices and fixed or varying degrees can create zig-zag or spiral paths for set distances or until the path self-intersects.




## Map Properties




Find long or short street names or street names with the most or fewest words or syllables and find runs of them or use them as waypoints.




Find all the street names on a particular theme (colours, saints' names, trees) and use them as waypoints to be joined in a walk.




Streets that are particularly straight or crooked can be joined to create rough or smooth paths to follow.




If height information can be added to the geodata graph, node elevation can be used as a property for routing. Join high and low points, flow downhill like water, or find the longest runs of valleys or ridges.




Information about [Named entities](https://en.wikipedia.org/wiki/Named-entity_recognition) extracted from street, location and district names from services such as [DBPedia](http://dbpedia.org/About) or [Freebase](http://www.freebase.com/) and used to connect them. Dates, historical locations, historical facts, biographical or scientific information and other properties are available from such services in a machine-readable form.




Routing between peaks and troughs in sociological information such as population, demographics, crime occurrence, ploitical affiliation, property prices can produce a journey through the social landscape.




## Locations of Interest




Points of interest in OpenStreetMap's data are represented by nodes tagged as "historic", "amenity", "leisure", etc. . It is trivial to find these nodes to use as destinations for walks across the geodata graph. They can then be grouped and used as waypoints in a route that will visit every coffee shop in a town, or one of each kind of amenity in alphabetical order, in an open or closed path for example. Making a journey joining each location with a central base will produce a star shape.




Places of worship (or [former Woolworth stores](http://www.guardian.co.uk/science/2010/jan/16/ben-goldacre-bad-science-aliens-woolworths) can be used to find [https://en.wikipedia.org/wiki/Ley_line](ley%20lines) using [linear regression](https://en.wikipedia.org/wiki/Linear_regression) or the techniques discussed below in "Geometry and Computer Graphics". 




## Semantics




The words of poems or song lyrics (less [stopwords](https://en.wikipedia.org/wiki/Stopwords)), matched either directly or through hypernyms using Wordnet, can be searched for in street and location names to use as waypoints in a path. Likewise named entities extracted from stories, news items and historical accounts.




More abstract narratives can be constructed using concepts from [The Hero's Journey](https://en.wikipedia.org/wiki/Hero%27s_journey).




Nodes found using any other technique can be grouped or sequenced semantically as waypoints using Wordnet hypernym matching.




## Isomorphism




Renamed Tube maps, and journeys through one city navigated using a map of another, are examples of using isomorphism in Psychogeography.




Entire city graphs are very unlikely to be isomorphic, and the routes between famous locations will contain only a few streets anyway, so sub-graphs are both easier and more useful for matching. Better geographic correlations between locations can be made by scoring possible matches using the lengths of ways and the angles of junctions. Match accuracy can be varied by changing the tolerances used when scoring.




Simple isomorphism checking can be performed using The NetworkX library's [functions](http://networkx.lanl.gov/reference/algorithms.isomorphism.html) . Projecting points from a subgraph onto a target graph then [brute-force searching](https://en.wikipedia.org/wiki/Brute_force_search) for matches by varying the [matrix](https://en.wikipedia.org/wiki/Transformation_matrix) used in the projection and scoring each attempt based on how closely the points match . Or Isomorphisms can be bred using [genetic algorithms](https://en.wikipedia.org/wiki/Genetic_algorithm), using degree of isomorphism as the fitness function and proposed subgraphs as the population.




## The Social Graph




Another key contemporary application of graph theory is [Social Network Analysis](https://en.wikipedia.org/wiki/Social_network_analysis). The techniques and tools from both the [social science](http://www.sagepub.com/books/Book209124) and [web 2.0](http://shop.oreilly.com/product/0636920010203.do) can be applied directly to geodata graphs.




Or the graphs of people's social relationships from Facebook, Twitter and other services can mapped onto their local geodata graph using the techniques from "Isomorphism" above, projecting their social space onto their geographic space for them to explore and experience anew.




## Geometry and Computer Graphics




Computer geometry and computer graphics or computer vision techniques can be used on the nodes and edges of geodata to find forms.




Shapes can be matched by using them to cull nodes using an [insideness test](http://www.w3.org/TR/SVG/painting.html#FillRuleProperty) or to find the nearest points to the lines of the shape. Or line/edge intersection can be used. Such matching can be made fuzzy or accurate using the matching techniques in "Isomorphism".




Simple geometric forms can be found - triangles, squares and quadrilaterals, stars. [Cycle bases](http://networkx.lanl.gov/reference/algorithms.cycles.html) may be a good source of these. Simple shapes can be found - smiley faces, house shapes, arrows, magical symbols. Sequences of such forms can be joined based on their mathematical properties or on semantics.




For more complex forms, face recognition, object recognition, or OCR algorithms can be used on nodes or edges to find shapes and sequences of shapes.




Classic computer graphics methods such as [L-sytems](https://en.wikipedia.org/wiki/L-system), [turtle graphics](https://en.wikipedia.org/wiki/Turtle_graphics), [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), or [Voronoi diagrams](https://en.wikipedia.org/wiki/Voronoi) can be applied to the Geodata graph in order to produce paths to follow.




Geometric animations or [tweens](https://en.wikipedia.org/wiki/Tweening) created on or mapped onto the geodata graph can be walked on successive days.




## Lived Experience




[GPS](https://en.wikipedia.org/wiki/Gps) traces generated by an individual or group can be used to create new journeys relating to personal or shared history and experience. So can individual or shared [checkins](https://en.wikipedia.org/wiki/Checkin#Social_check-in) from social networking services. Passenger level information for mass transport services is the equivalent for stations or airports.




Data streams of personal behaviour such as [scrobbles](https://en.wikipedia.org/wiki/Scrobbling), purchase histories, and [tweets](https://dev.twitter.com/docs/api/1/get/statuses/user_timeline) can be fetched and processed semantically in order to map them onto geodata. This overlaps with "Isomorphism", "Semantics", and "The Social Graph" above.




## Sensor Data




Temperature, brightness, sound level, radio wave, radiation, gravity and entropy levels can all be measured or logged and used as weights for pathfinding. Ths brings Psychogeodata into the realm of [Psychogeophysics](http://psychogeophysics.org/).




## Conclusion




This series of posts has made the case for the concept, practicality, and future potential of Psychogeodata. The existing code produces interesting results, and there's much more that can be added and experienced.




(Part one of this series can be found [here](/weblog/2011/12/29/psychogeodata-13/), part two can be found [here](/weblog/2011/12/30/psychogeodata-23/) . The source code for the Psychogeodata library can be found [here](https://gitorious.org/robmyers/psychogeodata) .)



