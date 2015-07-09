---
author: robmyers
comments: true
date: 2012-05-21 22:52:51+00:00
layout: post
slug: exploring_art_data_24
title: Exploring Art Data 24
wordpress_id: 1991
categories:
- Art Computing
- Art History
- Art Open Data
- Projects
---

(This post uses new features from the R Cultural Analytics Library version 1.0.6 .)  
  
We can divide an image into sections, analyse the R, G and B values of each of those sections and plot the results.  
  

    
    library(CulturalAnalytics)
    library(jpeg)
    library(vegan)
    ## http://blog.wolfram.com/2008/12/01/the-incredible-convenience-of-mathematica-image-processing/
    ## Load the image
    imgdir<-paste(system.file(package = "CulturalAnalytics"), "images", sep = "/")
    dirimgs<-paste(imgdir, dir(path = imgdir, pattern = ".jpg"), sep = "/")
    img<-readJPEG(dirimgs[1])
    ## Divide it into sections and get a table of the median RGB values
    sections<-divideImage(img, 8, 8)
    ## Get the median rgb values for each image
    rgbs<-sapply(sections, function(img){ coords(medianRgb(imageToRgb(img))) },
    USE.NAMES=FALSE)
    ## The list needs transposing so we have columns of r,g,b values
    rgbs<-t(rgbs)
    ## Give the columns useful names
    colnames(rgbs)<-c("r", "g", "b")
    ## Bubble Chart
    plot(rgbs[,"r"], rgbs[,"g"], type="n", xlim=c(0,1), ylim=c(0,1),
    main="Section Bubble Chart of \"Bonjour, Monsieur Corbet\"",
    sub="(size is blue)", xlab="Red", ylab="Green")
    images(rgbs[,"r"], rgbs[,"g"], sections, cex=rgbs[,"b"])

  

![courbet bubble graph](/assets/courbet-bubble-graph.png)  
  
This shows no areas of pure, saturated colour.  
  
Next we can cluster the sections of the image and show the resulting clusters.

    
    <tt>
    ## Cluster the tiles by colour
    ## http://stackoverflow.com/questions/9019632/how-to-create-a-cluster-plot-in-r
    ## 5 is arbitrary
    clusters<-kmeans(rgbs, 5)
    ## distance matrix
    rgbs.dists<-dist(rgbs)
    ## Multidimensional scaling
    cms<-cmdscale(rgbs.dists)
    ## Plot the clusters
    plot(cms, type="n", xlim=range(cms[,1]), ylim=range(cms[,2]),
    main="Section Clustering of \"Bonjour, Monsieur Corbet\"")
    groups<-levels(factor(clusters$cluster))
    images(cms[,1], cms[,2], sections, thumbnailWidth=20)
    ordispider(cms, factor(clusters$cluster), label=TRUE)
    ordihull(cms, factor(clusters$cluster), lty="dotted")<br></br> </tt>




![courbet section clustering](/assets/courbet-section-clustering.png)

  
If the plots didn't have helpful titles, would you be able to recognize the image?  
  
Despite the arbitrary number of clusters chosen the groupings make some visual sense. Improving on the number of clusters is left as an exercise for the reader.  




