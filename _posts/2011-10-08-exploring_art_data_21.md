---
author: robmyers
comments: true
date: 2011-10-08 15:21:50+00:00
layout: post
slug: exploring_art_data_21
title: Exploring Art Data 21
wordpress_id: 1954
categories:
- Art Computing
- Art History
- Art Open Data
- Projects
---

Now that we have a file of statistical information about the folder of images that we are examining, we can plot this using the images themselves.  
  
First we need to install and load the library we will use to load the images to plot. You may need to install ImageMagick's libmagick for EBImage to install, it doesn't seem to like GraphicsMagick.  
  
In Fedora run:  
  
`sudo yum install libmagick-devel`  
  
In Ubuntu run:  
  
`sudo aptitude install libmagick-dev`  
  

We can then install and load EBImage as follows:  
  

`
    
    ## source("http://bioconductor.org/biocLite.R")
    ## biocLite("EBImage")
    library("EBImage") 

`Next we declare constants to control various aspects of the plot. This includes the size of the image, the graphical properties of the elements that we are plotting, and which elements to plot.  
`
    
    ## The plot
    #inches
    plotWidth<-8
    plotHeight<-6
    plotBorder<-1
    innerWidth<-plotWidth - (plotBorder * 2)
    innerHeight<-plotHeight - (plotBorder * 2)
    plotBackgroundCol<-rgb(0.4, 0.4, 0.4, 1.0)
    ## Thumbnail images
    thumbnailWidth<-0.3
    ## Lines
    lineWidth<-1
    lineCol<-rgb(0.8, 0.8, 0.8, 1.0)
    ## Points
    ## This is the point scale factor (cex)
    pointSize<-2
    pointStyle<-19
    pointCol<-rgb(0.8, 0.8, 0.8, 1.0)
    ## Labels
    ## The label scale factor (cex)
    labelSize<-0.25
    labelCol<-rgb(1.0, 1.0, 1.0, 1.0)
    ## Axes
    axisLabelX<-""
    axisLabelY<-""
    axisCol<-rgb(1.0, 1.0, 1.0, 1.0)
    ## Number of significant digits to round fractional part of each tick value to
    axisRoundDigits<-3
    ## What to draw
    shouldDrawImages<-TRUE
    shouldDrawPoints<-TRUE
    shouldDrawLines<-TRUE
    shouldDrawLabels<-TRUE
    shouldDrawAxes<-TRUE 

`Then we declare variables and functions that will be used to process the data in order to fit its values into the plot in a visually appealing way.  
  
`
    
    minXValue<-NULL
    maxXValue<-NULL
    minYValue<-NULL
    maxYValue<-NULL
    scaleX<-NULL
    scaleY<-NULL
    ## Update the scaling factor for positioning images
    updateXYScale<-function(){
    rangeX<<-maxXValue - minXValue
    scaleX<<-innerWidth / rangeX
    rangeY<<-maxYValue - minYValue
    scaleY<<-innerHeight / rangeY
    }
    scaleXValue<-function(x){
    plotBorder + ((x - minXValue) * scaleX)
    }
    scaleYValue<-function(y){
    plotBorder + ((y - minYValue) * scaleY)
    }
    ## Set the range of the X and Y axes for positioning images
    setMinMaxXYValues<-function(xMin, yMin, xMax, yMax){
    minXValue<<-xMin
    maxXValue<<-xMax
    minYValue<<-yMin
    maxYValue<<-yMax
    updateXYScale()
    }
    ## Calculate the range of the X and Y axes for positioning images
    discoverMinMaxXYValues<-function(xValues, yValues){
    xRange<-range(xValues)
    yRange<-range(yValues)
    ## Handle 0..1 or a..b
    if(xRange[2] - xRange[1] > 1){
    xRange<-c(floor(xRange[1]), ceiling(xRange[2]))
    } else {
    xRange<-c(floor(xRange[1] * 1000) / 1000, ceiling(xRange[2] * 1000) / 1000)
    }
    if(yRange[2] - yRange[1] > 1){
    yRange<-c(floor(yRange[1]), ceiling(yRange[2]))
    } else {
    yRange<-c(floor(yRange[1] * 1000) / 1000, ceiling(yRange[2] * 1000) / 1000)
    }
    ## Floor and ceiling the values to round them to the nearest integers
    ## and make the values on the plot nicer
    setMinMaxXYValues(xRange[1], yRange[1], xRange[2], yRange[2])
    }
    ## Left X value for image
    ## image parameter accepted to give these calls a regular signature
    imageXLeft<-function(image, valueX){
    valueX
    }
    ## Right X value for image
    ## image parameter accepted to give these calls a regular signature
    imageXRight<-function(image, valueX){
    valueX + thumbnailWidth
    }
    ## Get the height of the image scaled to the new width
    imageHeightScaled<-function(image, scaledWidth){
    scale<-dim(image)[1] / scaledWidth
    dim(image)[2] / scale
    }
    ## Bottom Y value for image
    imageYBottom<-function(image, valueY){
    valueY - imageHeightScaled(image, thumbnailWidth)
    }
    ## Top Y value for image
    imageYTop<-function(image, valueY){
    valueY
    } 

`The labels for
each image, the points marking the image's position, the lines connecting each image, and the top left of each image are positioned on the x, y co-ordinates for the image's properties being plotted.  
  
Centering the image on the x, y co-ordinates might be more natural but it would obscure the position of the point and the connecting lines if they were also drawn.  
  
`
    
    plotLabels<-function(labelValues, xValues, yValues){
    ## Position the labels underneath the images
    text(xValues, yValues, labelValues, col=labelCol, cex=labelSize, pos=3)<br></br>}<br></br>

``
    
    plotImages<-function(imageFilePaths, xValues, yValues){
    for(i in 1:length(imageFilePaths)){
    image<-readImage(imageFilePaths[i])
    x<-xValues[i]
    y<-yValues[i]
    ## Does the image really have to be rotated???
    rasterImage(rotate(image), imageXLeft(image, x), imageYTop(image, y),
    imageXRight(image, x), imageYBottom(image, y))
    }
    } <br></br><br></br>

`When we plot the axes their tick values are auto-generated from the value ranges, so they may look weird.  
`
    
    plotAxes<-function(){
    xat<-round(seq(minXValue, maxXValue,
    (maxXValue - minXValue) / plotWidth),
    axisRoundDigits)
    axis(1, 0:plotWidth, xat, col=axisCol, col.ticks=axisCol, col.axis=axisCol)
    yat<-round(seq(minYValue, maxYValue,
    (maxYValue - minYValue) / plotHeight),
    axisRoundDigits)
    axis(2, 0:plotHeight, yat, col=axisCol, col.ticks=axisCol, col.axis=axisCol)
    } 

`Having written functions to plot each element, we declare an all-in-one function to plot everything that is enabled in the configuration constants above.  
`
    
    plotElements<-function(imageFilePaths, xValues, yValues, labelValues){
    if(shouldDrawLines){
    lines(xValues, yValues, col=lineCol, lwd=lineWidth)
    }
    if(shouldDrawPoints){
    points(xValues, yValues, pch=pointStyle, col=pointCol)
    }
    if(shouldDrawImages){
    plotImages(imageFilePaths, xValues, yValues)
    }
    if(shouldDrawLabels){
    plotLabels(labelValues, xValues, yValues)
    }
    if(shouldDrawAxes){
    plotAxes()
    }
    }
    

`
Then we declare a function to get the values from the data frame and call the plot-everything function.  
`
    
    setValuesAndPlot<-function(data, imageFilepaths, xColumn, yColumn,
    labelColumn="filename", discoverRange=TRUE){
    ## Get the lists for the data columns, get the doubles from them,
    ## and scale to the plot
    xValues<-data[xColumn][,1]
    yValues<-data[yColumn][,1]
    if(discoverRange){
    discoverMinMaxXYValues(xValues, yValues)
    }
    scaledXValues<-sapply(xValues, scaleXValue)
    scaledYValues<-sapply(yValues, scaleYValue)
    axisLabelX<<-xColumn
    axisLabelY<<-yColumn
    plotElements(imageFilepaths, scaledXValues, scaledYValues, data[,labelColumn])
    title(xlab=xColumn, ylab=yColumn, col.lab=axisCol)
    } 

`You'll notice each function is combining and building on earlier functions. Functions should be short, readable, organizing units. The next one that we declare reads the data file and the image files, and then plots the values.`
    
    <br></br>readAndPlot<-function(dataFile, imageFolder, xColumn, yColumn,
    labelColumn="filename", discoverRange=TRUE){
    data<-read.delim(dataFile, stringsAsFactors=FALSE)
    imageFilepaths<-sapply(data["filename"],
    function(filename) file.path(imageFolder, filename))
    setValuesAndPlot(data, imageFilepaths, xColumn, yColumn, labelColumn,
    discoverRange)
    }
    

`
The next function makes a new R plot with the proper graphics parameters
Notably this sets the bounds and background colour.  
`
    
    newPlot<-function(dataFile, imageFolder, xColumn, yColumn,
    labelColumn="filename", discoverRange=TRUE){
    ## Call before plot.new()
    par(bg=plotBackgroundCol)
    plot.new()
    ## Use co-ordinates relative to the bounds
    par(usr=c(0, plotWidth, 0, plotHeight))
    par(bty="n")
    readAndPlot(dataFile, imageFolder, xColumn, yColumn, labelColumn,
    discoverRange)
    }
    

`
Finally we can declare functions to plot to various different kinds of R devices. X11 for screen display and testing, PNG for embedding in web pages and documents, and PDF for high-quality output. Note that the PDF will include all the images plotted, and so it will become very large very quickly. A high-resolution PNG will be more practical for very large imagesets.  
`
    
    ## Make a new X11 plot
    X11Plot<-function(dataFile, imageFolder, xColumn, yColumn,
    labelColumn="filename", discoverRange=TRUE){
    X11(width=plotWidth, height=plotHeight)
    newPlot(dataFile, imageFolder, xColumn, yColumn, labelColumn, discoverRange)
    }
    ## Make a new PNG plot
    pngPlot<-function(outFile, dataFile, imageFolder, xColumn, yColumn,
    labelColumn="filename", discoverRange=TRUE, dpi=600){
    png(filename=outFile, width=plotWidth, height=plotHeight, units="in",
    res=dpi)
    newPlot(dataFile, imageFolder, xColumn, yColumn, labelColumn, discoverRange)
    dev.off()
    }
    ## Make a new PDF plot
    pdfPlot<-function(outFile, dataFile, imageFolder, xColumn, yColumn,
    labelColumn="filename", discoverRange=TRUE){
    pdf(file=outFile, width=plotWidth, height=plotHeight)
    newPlot(dataFile, imageFolder, xColumn, yColumn, labelColumn, discoverRange)
    dev.off()
    } 

`Calling these image generating commands from the REPL in Emacs or on the command line means that we can see the output and modify the constants we declared at the start and the parameters that we pass to the image plotting functions in order to modify and improve the results interactively.  
  
Running:  
`
    
    X11Plot("images.txt", "images", "brightness_median", "saturation_stdev") 

`Gives us:  
  
[![Mondrian Visualization](/assets_c/2011/09/r_image-thumb-500x392-57.png)](/assets_c/2011/09/r_image-57.html)Next we can wrap the functions we have written in command-line and GUI interfaces and explore the strengths and weaknesses of each.  
  


