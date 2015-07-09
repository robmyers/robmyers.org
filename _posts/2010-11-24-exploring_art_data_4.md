---
author: robmyers
comments: true
date: 2010-11-24 21:24:29+00:00
layout: post
slug: exploring_art_data_4
title: Exploring Art Data 4
wordpress_id: 1876
categories:
- Art Computing
- Art History
- Art Open Data
- Free Software
- Howto
---

Let's draw some more graphs.  
  
Here's the matrix of form and genre rendered graphically:  
  


    
    <tt>## Load the tab separated values for the table of artworks
    artwork<-read.delim("./visual_art/artwork.tsv")
    # Get rows with both genre and form
    ## This loses most of the data :-/
    art<-artwork[artwork$art_genre != "" & artwork$art_form != "",
    c("art_genre", "art_form")]
    ## Drop unused factors
    art$art_genre<-as.factor(as.character(art$art_genre))
    art$art_form<-as.factor(as.character(art$art_form))
    ## Get table
    art.table<-table(art) ##as.table(ftable(art))
    ## Strip rows and columns where max < tolerance
    tolerance<-3
    art.table.cropped<-art.table[rowSums(art.table) >= tolerance,
    colSums(art.table) >=tolerance]
    ## Print levelplot
    ## Levelplot is in the "lattice" library
    library("lattice")
    ## Rotate x labels, and set colour scale to white/blue to improve readablity
    levelplot(art.table.cropped, xlab="Genre", ylab="Form",
    scales=list(x=list(rot=90)),
    col.regions=colorRampPalette(c("white", "blue")))</tt>

  
  
![levelplot.png](/assets/2010/11/24/levelplot.png)The highest frequencies leap out of the graph. We should do a version without painting to look for subtleties in the rest of the data.  
  
And here's some of the basic frequencies from the data:  


    
    <tt><br></br>## Load the tab separated values for the table of artworks
    artwork<-read.delim("./visual_art/artwork.tsv")
    ## Function to plot a summary of the most frequent values
    topValuePlot<-function(values, numValues){
    ## Get a count of the number of times each value name appears in the list
    values.summary<-summary(values)
    ## Draw a graph, allowing enough room for the rotated labels
    par(mar=c(10,4,1,1))
    barplot(values.summary[1:numValues], las=2)
    }
    ## Artists
    topValuePlot(artwork$artist[artwork$artist != ""], 20)
    ## Subject
    topValuePlot(artwork$art_subject[artwork$art_subject != ""], 20)
    </tt>

![artists.png](/assets/2010/11/24/artists.png)


  
![subjects.png](/assets/2010/11/24/subjects.png)  
The dataset is clearly dominated by Western art.  




