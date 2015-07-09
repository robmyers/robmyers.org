---
author: robmyers
comments: true
date: 2010-12-31 13:24:53+00:00
layout: post
slug: exploring_art_data_13
title: Exploring Art Data 13
wordpress_id: 1902
categories:
- Aesthetics
- Art Computing
- Art Open Data
---

Let's go back and explore one image from the Haystacks series further. We'll be able to apply these same techniques to the whole series (and to large imagesets) later.  
  
We'll use the thumbnail of the first image in the series:  
  


    
    <tt>display(artworksThumbnails[[1]])</tt>


![](undefined)![](undefined)![](undefined)![](undefined)![](undefined)![haystack-screenshot.png](/assets/2010/12/31/haystack-screenshot.png)We've already got a box plot of its brightness and a plot of its palette. Now we will create a brightness histogram, a colour histogram, and measure its brightness, mean of brightness SD, and entropy (visual complexity).   
  
Brightness histogram:  
  


    
    <tt>## Plot brightness histogram
    hist(imageData(grayscaleArtworksThumbnails[[1]]),<br></br>     main=names(grayscaleArtworksThumbnails)[1],<br></br>     breaks=0:255/255, xlim=c(0, 1), xlab="Value", col=grey(0), border=NULL)</tt>


![brightness-histogram.png](/assets/2010/12/31/brightness-histogram.png)Colour Histogram (based on the work of [Dr. Sai Chaitanya Gaddam](http://cns.bu.edu/%7Egsc/ColorHistograms.html)):  


    
    <tt>
    ## install.packages("plyr") # for ddply
    library(plyr)
    ## Colour histogram
    ## http://cns.bu.edu/~gsc/ColorHistograms.html
    binResolution<-25
    colourImageHist<-function(bitmap, binResolution){
    rgbs<-imagePixelsRGBs(bitmap)
    scaledRGBs<-floor(rgbs * binResolution)
    counts<-ddply(scaledRGBs, .(red, green, blue), nrow)
    names(counts)[4]<-"count"
    attr(counts, "binResolution")<-binResolution
    counts
    }
    colourHist<-colourImageHist(artworksThumbnails[[1]], binResolution)
    ## Plot colour histogram
    plotColourHist<-function(colourHist){
    values<-apply(colourHist, 1,
    function(row){sum(row[c(1, 2, 3)])})
    valuesOrder<-order(values)
    countsOrdered<-colourHist$count[valuesOrder]
    binResolution<-attr(colourHist, "binResolution")
    colours<-apply(colourHist, 1,
    function(row){rgb(row[1] / binResolution,
    row[2] / binResolution,
    row[3] / binResolution)})
    coloursOrdered<-colours[valuesOrder]
    barplot(countsOrdered, col=coloursOrdered, border=NA)
    }
    plotColourHist(colourHist)</tt>


![colour-histogram.png](/assets/2010/12/31/colour-histogram.png)Colour histogram cloud (based on the work of [Dr. Sai Chaitanya Gaddam](http://cns.bu.edu/%7Egsc/ColorHistograms.html)):  


    
    <tt><br></br>## Plot colour cloud
    ## http://cns.bu.edu/~gsc/ColorHistograms.html
    sigmoid<-function(x){
    1 / (1 + exp(-x))
    }
    colourCloudX<-function(r,g,b){
    sigmoid((g - r + 1) / 2)
    }
    colourCloudY<-function(r,g,b){
    eps<-length(colours)
    (b + eps)/(r + g + b + 3 * eps)
    }
    randomPointInRadius<-function(x, y, radius){
    q<-runif(1) * (pi * 2)
    r<-radius * sqrt(runif(1))
    h<-r * cos(q)
    v<-r * sin(q)
    c(x + h, y + v)
    }
    randomizedBinPoints<-function(xs, ys, radius){
    coords<-array(dim=c(length(xs), 2))
    for(index in 1:length(xs)){
    point<-randomPointInRadius(xs[index], ys[index], radius)
    coords[index, 1]<-point[1]
    coords[index, 2]<-point[2]
    }
    coords
    }
    colourCloud<-function(hist, title="", radius=0.005, dotSize=1){
    binResolution<-attr(hist, "binResolution")
    bins<-hist[c(1,2,3)] / binResolution
    ## Rep each item by the count that applies to its bin, this allows us to
    ## process the repeated item lists directly rather than nest loops & counters
    xs<-rep(apply(bins, 1, function(col){colourCloudX(col[1], col[2], col[3])}),
    hist$count)
    ys<-rep(apply(bins, 1, function(col){colourCloudY(col[1], col[2], col[3])}),
    hist$count)
    hexes<-rep(apply(bins, 1, function(c){rgb(c[1], c[2], c[3])}),
    hist$count)
    coords<-randomizedBinPoints(xs, ys, radius)
    plot(coords[,1], coords[,2], bg=hexes, main=title, cex=dotSize,
    col=NULL, pch=21, xlab="", ylab="", xaxt="n", yaxt="n")
    }
    colourCloud(colourHist)
    </tt>


![colour-cloud.png](/assets/2010/12/31/colour-cloud.png)Image brightness mean (not very interesting for a single image):  


    
    <tt><br></br>mean(unlist(imageData(grayscaleArtworksThumbnails[[1]])))</tt>


  

    
    [1] 0.6130143


  
Mean of image brightness standard deviation:  


    
    <tt><br></br>mean(sd(unlist(imageData(grayscaleArtworksThumbnails[[1]]))))</tt>



    
    <br></br>[1] 0.1069661


  
Image brightness entropy:  


    
    <tt><br></br>## Calculate image entropy
    imageEntropy<-function(histogram){
    nonzeroCounts<-histogram$counts[histogram$counts > 0]
    probs<-nonzeroCounts / sum(nonzeroCounts)
    -sum(probs * log2(probs))
    }
    imageEntropy(hist(imageData(grayscaleArtworksThumbnails[[1]]),
    breaks=0:255/255, plot=FALSE))</tt>

  


    
    [1] 7.112374


  
Image colour entropy:  
  


    
    <tt>imageEntropy(hist(imageData(artworksThumbnails[[1]]),
    breaks=0:255/255, plot=FALSE))</tt>

  


    
    [1] 7.572906



