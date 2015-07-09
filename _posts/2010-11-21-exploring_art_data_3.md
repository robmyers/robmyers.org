---
author: robmyers
comments: true
date: 2010-11-21 22:42:07+00:00
layout: post
slug: exploring_art_data_3
title: Exploring Art Data 3
wordpress_id: 1875
categories:
- Art Computing
- Art Open Data
---

Let's look at how much the "Grants For The Arts" programme of Arts Council England (ACE) gives to each region.  
  
First of all we'll need the data. That's available from data.gov.uk under the new CC-BY compatible Crown Copyright [here](http://data.gov.uk/dataset/grants-for-the-arts-awards-arts-council-england). It's in XLS format, which R doesn't load on GNU/Linux, but we can convert that to comma-separated values using OpenOffice.org Calc.  
  
Next we'll need a map to plot the data on. Ideally we'd use a Shapefile of the English regions, which R would be able to load and render easily, but there isn't a freely available one. There's a public domain SVG map of the English regions [here](https://secure.wikimedia.org/wikipedia/commons/wiki/File:England_Regions_-_Blank.svg), but R doesn't load SVG either. We can convert the SVG to a table of co-ordinates that we can plot from R using a Python script:  
  


    
    <tt>#!/usr/bin/python
    from BeautifulSoup import BeautifulStoneSoup
    import re
    # We know that the file consists of a single top-level g
    # containing a flat list of path elements.
    # Each path consists of subpaths only using M/L/z
    # So use this knowledge to extract the polylines
    # Convert svg class names to gfta region names
    names = {"east-midlands":"East Midlands", "east-england":"East of England",
    "london":"London", "north-east":"North East",
    "north-west":"North West", "south-east":"South East",
    "south-west":"South West", "west-midlands":"West Midlands",
    "yorkshire-and-humber":"Yorkshire and The Humber"}
    svg = open("map/England_Regions_-_Blank.svg")
    soup = BeautifulStoneSoup(svg)
    # Get the canvas size, to use for flipping the y co-ordinate
    height = float(soup.svg["height"])
    # Get the containing g
    g = soup.find("g")
    # Get the translate in the transform
    transform = re.match(r"translate\((.+), (.+)\)", g["transform"])
    transform_x = float(transform.group(1))
    transform_y = float(transform.group(2))
    # Get the paths in the g
    paths = g.findAll("path")
    print("region,subpath,x,y")
    for path in paths:
    # Get the id and convert to region name
    region_name = names[path["id"]]
    # Get the path data to process
    path_d = path["d"]
    # Split around M commands to get subpaths
    path_d_subpaths = path_d.split("M")
    # Keep a count of the subpaths within the id so we can identify them
    subpath_count = 0
    for subpath in path_d_subpaths:
    # The split will result in a leading empty string
    if subpath == "":
    continue
    subpath_count = subpath_count + 1
    # Split around the L commands to get a list of points
    # The first M point already has its command letter removed
    points = subpath.split("L")
    for point in points:
    # Remove trailing z if present
    cleaned_point = point.split()[0]
    # Split out the point components and translate them
    (x, y) = cleaned_point.split(",")
    transformed_x = float(x) + transform_x
    flipped_y = height + (height - float(y))
    transformed_y = flipped_y + transform_y
    # Write a line in the csv
    print "%s,%s,%s,%s" % (region_name, subpath_count, transformed_x,
    transformed_y)
    </tt>


Now we can load the grants data and the map into R, calculate the total value of grants for each region, and colour each region of the map accordingly.  
  
Here's the R code:  
  


    
    <tt>## The data used to plot a map of the English regions
    england<-read.csv("map/England_Regions_-_Blank.csv",
    colClasses=c("factor", "integer", "numeric", "numeric"))
    ## Plot the English regions in the given colours
    ## See levels(england$region) for the region names
    ## colours is a list of region="#FF00FF" colours for regions
    ## range.min and range.max are for the key values
    ## main.title is the main label for the plot
    ## key.title is the title for the key
    plotEnglandRegions<-function(colours, range.min, range.max, main.title,
    key.title){
    plot.new()
    ## Reasonable values for the window size
    plot.window(c(0, 600),
    c(0, 600))
    ## For each regionname
    lapply(levels(england$region),
    function(region){
    if (region %in% levels(england$region)){
    ## For each subpath of each region
    lapply(1:max(england$subpath[england$region == region]),
    function(subpath){
    ## Get the points of that subpath
    subpath.points<-england[england$region == region &
    england$subpath == subpath,]
    ## And colour it the region's colour
    polygon(subpath.points$x, subpath.points$y,
    col=colours[[region]])
    })
    }
    })
    ## Colour Scale
    ## Turn off scientific notation (for less than 10 digits)
    options(scipen=10)
    ## Sort the colours so they match the values
    colours.sorted<-sort(colours)
    ## The by is set to fit the number of colours and the value range
    legend("topright", legend=seq(from=range.min, to=range.max,
    by=((range.max - range.min) / (length(colours) - 1))),
    fill=colours.sorted,
    title=key.title)
    title(main.title)
    }
    ## Load the region award data
    region<-read.csv("gfta/gfta_awards09_10_region.csv",
    colClasses=c("integer", "character", "character", "character",
    "character", "factor", "factor", "factor",
    "factor", "factor"))
    ## region$Award.amount contains commas
    region$Award.amount<-gsub(",", "", region$Award.amount)
    ## And we want it as a number
    region$Award.amount<-as.integer(region$Award.amount)
    ## Get the totals by region
    region.totals<-tapply(region$Award.amount, list(region$Region), sum)
    ## But we don't want the "Other" region
    region.totals<-region.totals[names(region.totals) != "Other"]
    ## Calculate the range of colours
    ## The minimum value, to the nearest lowest million
    value.max<-12000000
    ## The highest vvalue, to the nearest highest million
    value.min<-4000000
    ## The darkest colour (in a range of 0.0 to 1.0)
    colour.base<-0.15
    ## How to get the range of colours between that and 1.0
    colour.multiplier<-(1.0 - colour.base) / (value.max - value.min)
    ## Make the colour levels
    levels<-lapply(region.totals,
    function(i){
    colour.base + (i - value.min) * colour.multiplier})
    colours<-rgb(levels, 0, 0)
    ## Add the region names to the colours
    names(colours)<-names(region.totals)
    ## Plot each region in the given colour
    plotEnglandRegions(colours, value.min, value.max, "Grants For The Arts 2009/10",
    "Total awards in £")</tt>


And here's the resulting map:  
  


[![gtfa.png](/assets/assets_c/2010/11/gtfa-thumb-400x377-32.png)](/weblog/assets_c/2010/11/gtfa-32.html)Who can point out the methodological flaw in this visualisation? ;-)  




