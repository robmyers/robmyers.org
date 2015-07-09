---
author: robmyers
comments: true
date: 2010-11-29 20:32:05+00:00
layout: post
slug: exploring_art_data_5
title: Exploring Art Data 5
wordpress_id: 1879
categories:
- Art History
- Art Open Data
---

Let's look at some institutional data. We can scrape the Tate Galleries attendance figures from [here](http://www.tate.org.uk/about/ourpriorities/audiences/marketresearch/visitor_figures.htm) and make a csv file of them. The first few lines of attendance.csv look like this:  
  

    
    <tt>"Year","Tate Britain","Tate Modern","Tate Liverpool","Tate St Ives","BHM","Total"
    2009,1595000,4788000,523000,219000,N/A,7125000
    2008,1587655,4647881,1035958,203700,N/A,7475194
    2007,1533217,5236702,694228,243993,N/A,7708140
    2006,1597359,4895073,556976,193700,46220,7289328
    2005,1729692,3902017,666258,180771,43502,6522240</tt>

Now we can load the data into R and start working with the data:  


    
    <tt><br></br>## Read the csv file, N/A values and all, allowing spaces in column names
    attendance<-read.csv("attendance.csv", na.strings="N/A", check.names=FALSE)
    ## Give the BHM a more descriptive name
    names(attendance)[names(attendance) %in% c("BHM")]<-"Barbara Hepworth Museum"
    ## Get the years
    years<-attendance[,1]
    ## Get the individual site counts (last column is total)
    sites<-attendance[,2:(length(attendance) -1)]</tt>


We can draw a multiple line graph of the attendance figures:  
  


    
    <tt>## Create lists of line properties so we can use them in the graph and legend
    line.types<-c("solid", "dashed", "dotted", "dotdash", "longdash", "twodash")
    line.colours<-c("cyan", "blue", "purple", "red", "orange", "green")
    ## Suppress the y axis so we can draw one that doesn't use scientific notation
    matplot(years, sites, type = "l", yaxt="n",
    xlab="Year",ylab="Attendance",
    col=line.colours, lty=line.types)
    ## Draw the y axis using full numbers rather than scientific notation
    axis(2, axTicks(2), format(axTicks(2), scientific = F))
    ## Add a key to the lines
    legend("topleft", names(sites), col=line.colours, lty=line.types)
    ## Title the graph
    title(main="Tate Galleries Attendance 1980-2010")</tt>


![attendance1.png](/assets/2010/11/29/attendance1.png)And we can use an area chart to show the combined attendance. It's not the best way of examining information, but in this case it shows how the attendance figures stack up, literally:  


    
    <tt><br></br>## Import the ggplot2 library so we can use ggplot
    library("ggplot2")
    ## To get an area plot, we need to flatten the data to year/museum/attendance
    attendance.expanded<-data.frame(Year=rep(years, ncol(sites)),
    Museum=rep(names(sites), each=length(years)),
    Attendance=unlist(sapply(names(sites),
    function(col) {sites[col]}, simplify=TRUE)))
    ## We use the levels of the Museum factor to order the areas and legend labels
    ## We do this by clculating the range of attendance at each museum and ordering
    ## the factor names based on that
    attendance.expanded$Museum<-
    factor(attendance.expanded$Museum,
    levels=names(sites)[order(sapply(names(sites),
    function(x){max(sites[x], na.rm=TRUE) -
    min(sites[x], na.rm=TRUE)}))])
    ## A utility function to format numbers in English non-scientific format
    nonscientific<-function(x, ...)
    format(x, big.mark = ',', scientific = FALSE, ...)
    ## Plot the areas
    ggplot(attendance.expanded, aes(x=Year, y=Attendance)) +
    geom_area(aes(legend.title="Site", fill=Museum)) +
    ## Label the y axis in millions rather than scientific notation
    scale_y_continuous(formatter=nonscientific) +
    ## Specifying the breaks orders the legend properly
    scale_fill_brewer(palette=2, breaks=rev(levels(attendance.expanded$Museum))) +
    ## Set a nice title
    opts(title="Tate Galleries Attendance 1980-2010")
    </tt>

![attendance2.png](/assets/2010/11/29/attendance2.png)

  




