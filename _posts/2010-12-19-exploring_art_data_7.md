---
author: robmyers
comments: true
date: 2010-12-19 19:39:10+00:00
layout: post
slug: exploring_art_data_7
title: Exploring Art Data 7
wordpress_id: 1894
categories:
- Art Open Data
---

We've looked at brightness and contrast, let's look at colours.  
  
The images we've downloaded are stored in traditional computer graphics style as red, green and blue values (RGB values). We can extract the RGB values from the image and create a palette for the image using a standard "clustering" function. We can then sort the colours in the palette in order of brightness in order to make the palette easier to look at when we plot it.  


    
    <tt>
    ## Get the r,g,b colour values for all the pixels in the image as a list
    imagePixelsRGBs<-function(bitmap){
    ## Get flat lists of red, green and blue pixel values
    red<-imageData(channel(bitmap, "red"))
    dim(red)<-NULL
    green<-imageData(channel(bitmap, "green"))
    dim(green)<-NULL
    blue<-imageData(channel(bitmap, "blue"))
    dim(blue)<-NULL
    ## Combine these lists into a table of pixel r,g,b values
    rgbs<-data.frame(red=red, green=green,blue=blue)
    }
    ## Sort a palette's colours in rough order of brightness
    sortPaletteColours<-function(palette){
    colourValues<-apply(palette, 1, sum)
    palette[order(colourValues),]
    }
    ## Quantize the colours (extract a colour palette
    quantizeColours<-function(bitmap, count){
    rgbs<-imagePixelsRGBs(bitmap)
    ## Cluster r,g,b values as points in RGB space
    clusters<-kmeans(rgbs, count)
    ## The centre of each cluster is its average colour
    averageColours<-clusters$centers
    ## Return the colours in brightness order
    sortPaletteColours(averageColours)
    }
    ## Get palettes for each painting
    colourCount<-8
    palettes<-lapply(artworksThumbnails,
    function(bitmap){quantizeColours(bitmap, colourCount)})</tt>

  

Having got the palettes we can sort them in order of total brightness.  


    
    <tt>
    ## Get the palettes in order of brightness
    sortPalettes<-function(palettes){
    ## Sum the pixel values and divide them by the number of pixels
    paletteValues<-sapply(palettes,
    function(palette){sum(palette) / length(palette)})
    palettes[order(paletteValues)]
    }
    ## Sort the colours in order of brightness
    sortedPalettes<-sortPalettes(palettes)</tt>

  

And finally we can convert the colours to yet another format and plot the palettes.  


    
    <tt><br></br>## Convert the palette colours to R colours
    paletteToColours<-function(palette){
    apply(palette, 1,
    function(colour){rgb(colour[1], colour[2], colour[3])})
    }
    ## Plot palettes
    ## Get a flat list of colours
    palettesColours<-sapply(sortedPalettes, paletteToColours, USE.NAMES=FALSE)
    ## Plot the colours for each palette
    par(mar=c(4, 20, 4, 4))
    image(matrix(1:(length(sortedPalettes) * colourCount), colourCount,
    length(sortedPalettes)), col=palettesColours, axes=FALSE)
    axis(2, at=seq(0.0, 1.0, 1.0 / (length(sortedPalettes) - 1)),
    labels=names(sortedPalettes), las=2, tick=0)</tt>

  

Which looks like this:  
  
![palettes.png](/assets/2010/12/19/palettes.png)Better palette extraction and more perceptual brightness sorting are left as exercises for the reader. :-)  


