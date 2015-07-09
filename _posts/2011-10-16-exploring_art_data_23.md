---
author: robmyers
comments: true
date: 2011-10-16 17:49:53+00:00
layout: post
slug: exploring_art_data_23
title: Exploring Art Data 23
wordpress_id: 1960
categories:
- Art Computing
- Art Open Data
- Free Software
---

Having written a command-line interface (CLI), we will now write a graphical user interface (GUI). GUIs can be an effective way of managing the complexity of software, but their disadvantage is that they usually cannot be effectively scripted like CLI applications and that they usually cannot be extended or modified as simply or as deeply as code run from a REPL.  
  

That said, if software is intended as a stand-alone tool for performing tasks that will not be repeated and do not require much setup, a GUI can be very useful. So we will write one for the code in image-properties.r  
  

As with the CLI version, we will run this code using RScript. The script can be run from the command line, or an icon for it can be created in the operating system's applications menu or dock.
`
    
    
    #!/usr/bin/env Rscript
    ## -*- mode: R -*-
    

`
The GUI framework that we will use is the cross-platform gWidgets library. I have set it up to use Gtk here, but Qt and Tk versions are available as well. You can find out more about gWidgets at [http://cran.r-project.org/web/packages/gWidgets/index.html](http://cran.r-project.org/web/packages/gWidgets/index.html).
`
    
    
    ## install.packages("gWidgetsRGtk2", dep = TRUE)
    require(gWidgets)
    options("guiToolkit"="RGtk2")
    

`
We source properties-plot.r to load the code that we will use to plot the image once we have gathered all the configuration information we need using the GUI
`
    
    
    source('properties-plot.r')
    

`
The first part of the GUI that we define is the top level window and layout. The layout of the top level window is a tabbed pane of the kind used by preferences dialogs and web browsers. We use this to organise the large number of configuration options for the code and to present them to the user in easily understood groupings.  

Notice the use of "layout" objects as matrices to arrange interface widgets such as buttons within the window and later within each page of the "notebook" tabbed view.
`
    
    
    win<-gwindow("gui", visible=FALSE)
    layout<-glayout(container=win)
    nb<-gnotebook(expand=TRUE)
    layout[1,1]<-nb
    layout[2,1]<-gbutton("Render Image", callback=renderImage)
    

`
The first tab contains code to create and handle input from user interface elements for selecting the kind of plot, the data file and folder of images to use, and the file to save the plot as if required. It also allows the user to specify which properties from the data file to plot.
`
    
    
    table<-glayout(container=nb, label="Files And Columns")
    table[1,1]<-glabel("Render:")
    table[1,2]<-gcombobox(c("Display","PDF", "PNG"), handler=updateSaveFile)
    table[2,1]<-glabel("Data File:")
    dataFileGedit<-gedit("")
    table[2,2]<-dataFileGedit
    table[2,3]<-gbutton("Set Data File...", handler=setDataFile)
    table[3,1]<-glabel("Image Folder:")
    imageFolderGedit<-gedit("")
    table[3,2]<-imageFolderGedit
    table[3,3]<-gbutton("Set Image Folder...", handler=setImageFolder)
    saveImageLabel<-glabel("Save Image:", enable=FALSE)
    table[4,1]<-saveImageLabel
    saveImageGedit<-gedit("", enable=FALSE)
    table[4,2]<-saveImageGedit
    saveImageButton<-gbutton("Set Image File...", enable=FALSE, handler=setSaveFile)
    table[4,3]<-saveImageButton
    enableSaveFile(FALSE)
    table[5,1]<-glabel("X Value Column:")
    table[5,2]<-gedit("brightness_median")
    table[6,1]<-glabel("Y Value Column:")
    table[6,2]<-gedit("saturation_median")
    table[7,1]<-glabel("Y Value Column:")
    table[7,2]<-gedit("saturation_median")
    table[8,1]<-glabel("Filename Column:")
    table[8,2]<-gedit("filename")
    table[9,1]<-glabel("Icon Label Column:")
    table[9,2]<-gedit("filename")
    

`
We use functions to allow the user to choose the data file, image folder, and save file. Using the GUI framework's built-in support for file choosing makes this code remarkably compact.
`
    
    
    setDataFile<-function(button, ...){
    choice<-gfile(type="open", text="Select the data file...",
    filter=list("All files"=list(patterns=c("*")),
    "TSV files"=list(patterns=c("*.txt"))))
    ## No choice == NA
    if(! is.na(choice)){
    svalue(dataFileGedit)<-choice
    }
    }
    setImageFolder<-function(button, ...){
    choice<-gfile(type="selectdir", text="Select the image folder...")
    ## No choice == NA
    if(! is.na(choice)){
    svalue(imageFolderGedit)<-choice
    }
    }
    initialSaveFile<-NA
    filterSaveFile<-NA
    setSaveFile<-function(button, ...){
    choice<-gfile(type="save", text="Select the file to save to...",
    initialfilename=initialSaveFile,
    filter=list("All files"=list(patterns=c("*")), filterSaveFile))
    ## No choice == NA
    if(! is.na(choice)){
    svalue(imageFolderGedit)<-choice
    }
    }
    

`
Often part of the GUI must be updated, enabled or disabled in response to changes in another part. When the user selects a "Display" plot we need not require the user to select a file to save the plot in, as the plot will be displayed in a window on the screen. The next functions implement this logic.
`
    
    
    updateSaveFile<-function(combo, ...){
    print(svalue(combo$obj))
    enableSaveFile(svalue(combo$obj) != "Display")
    if(svalue(combo$obj) == "PDF"){
    initialSaveFile<<-"image.pdf"
    filterSaveFile<<-list("PDF files"=list(patterns("*.pdf")))
    } else if(svalue(combo$obj) == "PNG"){
    initialSaveFile<<-"image.png"
    filterSaveFile<<-list("PNG files"=list(patterns("*.png")))
    }
    }
    enableSaveFile<-function(enable){
    print(enable)
    enabled(saveImageLabel)<-enable
    enabled(saveImageGedit)<-enable
    enabled(saveImageButton)<-enable
    }
    

`
The second tab contains fields to allow the user to configure the basic visual properties of the plot, its height, width, and background colour.
`
    
    
    table<-glayout(container=nb, label="Image")
    table[1,1]<-glabel("Width:")
    table[1,2]<-gtext(as.character(plotWidth))
    table[2,1]<-glabel("Height:")
    table[2,2]<-gtext(as.character(plotHeight))
    table[3,1]<-glabel("Background Colour:")
    table[3,2]<-gtext("")
    

`
The third tab allows the user to control the plotting of images, labels, points and lines.
`
    
    
    table<-glayout(container=nb, label="Plotting")
    table[1,1]<-gcheckbox(text="Draw Images", checked=true)
    table[2,1]<-glabel("Width:")
    table[2,2]<-gtext(thumbnailWidth)
    table[3,1]<-gcheckbox(text="Draw Labels", checked=true)
    table[4,1]<-glabel("Label Scale:")
    table[4,2]<-gtext(pointSize)
    table[5,1]<-glabel("Label Colour:")
    table[5,2]<-gtext("")
    table[6,1]<-gcheckbox(text="Draw Points", checked=true)
    table[7,1]<-glabel("Point Scale:")
    table[7,2]<-gtext(pointSize)
    table[8,1]<-glabel("Point Style:")
    table[8,2]<-gtext(pointStyle)
    table[9,1]<-glabel("Point Colour:")
    table[9,2]<-gtext("")
    table[10,1]<-gcheckbox(text="Draw Lines", checked=true)
    table[11,1]<-glabel("Line Width:")
    table[11,2]<-gtext(pointSize)
    table[12,1]<-glabel("Line Colour:")
    table[12,2]<-gtext("")
    

`
The fourth (and final) tab allows the user to manage how the axes are plotted.
`
    
    
    table4<-glayout(container=nb, label="Axes")
    table4[1,1]<-gcheckbox(text="Draw Axes", checked=true)
    table4[2,1]<-glabel("Axis Round Digit Precision:")
    table4[2,2]<-gslider(from=0, to=10, by=1, value=axisRoundDigits)
    table4[3,1]<-glabel("X Axis Label:")
    table4[3,2]<-gtext(axisLabelX)
    table4[4,1]<-glabel("Y Axis Label:")
    table4[4,2]<-gtext(axisLabelY)
    table4[5,1]<-glabel("Axis Colour:")
    table4[5,2]<-gtext("")
    

`
Having created the contents of each tab, we set the initial tab that will be shown to the user and display the window on the screen.
`
    
    
    svalue(nb)<-1
    visible(win)<-TRUE
    

`
Next we will write code to set the values of the global variables from the GUI, and perform a render. Until then, we can define a do-nothing renderImage function to allow us to run and test the GUI code.
`
    
    
    renderImage<-function(){
    FALSE
    }
    

`
If we save this code in a file called propgui and make it executable using the shell command:  
  

chmod +x propgui  
  

We can call the script from the command line like this:  
  

./propgui  
  

We can enter values into the fields of the GUI, choose files, and press buttons (although pressing the Render button will of course have no effect yet).

