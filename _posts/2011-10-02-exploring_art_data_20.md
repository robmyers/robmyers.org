---
author: robmyers
comments: true
date: 2011-10-02 12:27:41+00:00
layout: post
slug: exploring_art_data_20
title: Exploring Art Data 20
wordpress_id: 1951
categories:
- Art Computing
- Art Open Data
- Projects
---

[Exploring Art Data 18 and 19 concern parsing and charting the Graves Art Sales data covering Constable. They will be published later.]  
  
Let's reproduce the functionality of [ImagePlot](http://lab.softwarestudies.com/2011/09/introducing-imageplot-software-explore.html) in R . We'll do this in several stages. In this post we'll write code to produce statistical information about collections of image files. In the next post we'll write code to visualize that information. Then we'll write command line and graphical user interface code for the visualization. Finally we'll use the command line code to look at how to perform image analysis distributed over the network.  
  
For the statistical analysis code (`image-properties.r`), first we'll need to install and load some libraries:  
  

    
    <code>## source("http://bioconductor.org/biocLite.R")
    ## biocLite("EBImage")
    ## You may need to install libmagick for EBImage
    library("EBImage")
    ##install.packages("colorspace")
    library("colorspace")
    </code>


  
Then we will need to write code to convert from the computer-friendly RGB colourspace to the human-friendly HSB colourspace.  


    
    <code>
    ## Get the r,g,b colour values for all the pixels in the image as a list
    imageRgbs<-function(bitmap){
    ## Get flat lists of red, green and blue pixel values
    red<-imageData(channel(bitmap, "red"))
    dim(red)<-NULL
    green<-imageData(channel(bitmap, "green"))
    dim(green)<-NULL
    blue<-imageData(channel(bitmap, "blue"))
    dim(blue)<-NULL
    ## Combine these lists into a table of pixel r,g,b values
    data.frame(red=red, green=green,blue=blue)
    }
    ## Convert the RGB data.frame to an RGB objects collection
    rgbToHsv<-function(rgbs){
    as(RGB(rgbs$red, rgbs$green, rgbs$blue), "HSV")
    }
    </code>


  
Next we write the code to produce the statistics for each image. R makes this very easy.  


    
    <code>
    ## Calculate the median values for the HSV coordinates
    ## The colour returned is not a colour in the image,
    ## it just contains the median values
    medianHsv<-function(hsvcoords){
    HSV(median(hsvcoords[,"H"]), median(hsvcoords[,"S"]), median(hsvcoords[,"V"]))
    }
    ## Calculate the minimum and maximum values for the HSV coordinates
    ## Returns a vector of colours, the first containing low values,
    ## the second containing high values
    ## These are not colours that appear in the image, they just contain the values
    rangeHsv<-function(hsvcoords){
    hrange<-range(hsvcoords[,"H"])
    srange<-range(hsvcoords[,"S"])
    vrange<-range(hsvcoords[,"V"])
    c(min=HSV(hrange[1], srange[1], vrange[1]),
    max=HSV(hrange[2], srange[2], vrange[2]))
    }
    ## Calculate the standard deviation for the HSV coordinates
    ## The colour returned is not a colour in the image,
    ## it just contains the sd for each value
    sdHsv<-function(hsvcoords){
    hsd<-sd(hsvcoords[,"H"])
    ssd<-sd(hsvcoords[,"S"])
    vsd<-sd(hsvcoords[,"V"])
    HSV(hsd[1], ssd[1], vsd[1])
    }
    ## A good way of getting the min, max, median and other useful values
    summaryHsv<-function(hsvcoords){
    list(H=summary(hsvcoords[,"H"]),
    S=summary(hsvcoords[,"S"]),
    V=summary(hsvcoords[,"V"]))
    }
    </code>

  
Now we write the code to output those statistics. This is slightly more complex than the simplest possible way of structuring the code would be in order to make the code more robust if we need to change it later.  


    
    <code>
    ## HSV == HSB
    ## We use brightness for compatibility
    ## Some columns and column names are also for compatibility
    ## Load the file and return a vector of named interesting statistics
    fileRow<-function(filename){
    cat(filename, sep="\n")
    img<-readImage(filename)
    rgbs<-imageRgbs(img)
    hsvs<-rgbToHsv(rgbs)
    hsvcoords<-coords(hsvs)
    summaryhsv<-summaryHsv(hsvcoords)
    sdhsv<-sdHsv(hsvcoords)
    sdhsvcoords<-coords(sdhsv)
    ## NaN for year for now
    c("year"=NaN,
    ## Get the values manually so that we don't rely on position in case
    ## that ever changes
    "hue_min"=summaryhsv$H[["Min."]],
    "hue_1st_qu"=summaryhsv$H[["1st Qu."]],
    "hue_median"=summaryhsv$H[["Median"]],
    "hue_mean"=summaryhsv$H[["Mean"]],
    "hue_3rd_qu"=summaryhsv$H[["3rd Qu."]],
    "hue_max"=summaryhsv$H[["Max."]],
    "hue_stdev"=sdhsvcoords[,"H"][[1]], ## There must be a better way than this
    "saturation_min"=summaryhsv$S[["Min."]],
    "saturation_1st_qu"=summaryhsv$S[["1st Qu."]],
    "saturation_median"=summaryhsv$S[["Median"]],
    "saturation_mean"=summaryhsv$S[["Mean"]],
    "saturation_3rd_qu"=summaryhsv$S[["3rd Qu."]],
    "saturation_max"=summaryhsv$S[["Max."]],
    "saturation_stdev"=sdhsvcoords[,"S"][[1]],
    "brightness_min"=summaryhsv$V[["Min."]],
    "brightness_1st_qu"=summaryhsv$V[["1st Qu."]],
    "brightness_median"=summaryhsv$V[["Median"]],
    "brightness_mean"=summaryhsv$V[["Mean"]],
    "brightness_3rd_qu"=summaryhsv$V[["3rd Qu."]],
    "brightness_max"=summaryhsv$V[["Max."]],
    "brightness_stdev"=sdhsvcoords[,"V"][[1]])
    }
    ## Create a frame containing interesting information about the images
    filesSummaries<-function(filenames, folder){
    cat("Processing: ")
    cat(filenames, sep=", ")
    filepaths<-sapply(filenames,
    function(filename) file.path(folder, filename))
    ## data.frame columns can be different types, so we add the filenames here
    ## We don't have the strings as factors as if we paste() them as factors
    ## they are pasted as numbers (levels)
    data.frame(filename=filenames,
    imageID=1:length(filenames),
    t(sapply(filepaths, fileRow)), stringsAsFactors=FALSE)
    }
    ## Print the fileDetails frame to a tab-separated-values file
    ## This can easily be loaded back into R
    printFilesSummaries<-function(fileDetails, outfile=""){
    ## Build an array of values for the file images,
    ## and make it a frame with the filenames as a column
    cat(paste(names(fileDetails), collapse="\t"), file=outfile)
    cat("\n", file=outfile)
    for(row in 1:dim(fileDetails)[1]){
    cat(paste(fileDetails[row,], collapse="\t"), file=outfile)
    cat("\n", file=outfile)
    }
    cat("Done.", sep="\n")
    }
    </code>

  
This code can be run from an interactive R session. For scripting and distribution it can be convenient to have a command-line interface to the code. So in another file (`imgstats`) we write a simple command-line interface to the code.  

First of all we load the image statistics code

    
    <code>
    source("image-properties.r")
    </code>


Then we parse the command line arguments and make sure that the user has provided reasonable values to the script, quitting with an advisory message if they have not.

    
    <code>
    ################################################################################
    ## Parse the command line
    ################################################################################
    args<-commandArgs(TRUE)
    if(length(args) != 1){
    stop(paste("usage: imgstats [foldername]"))
    }
    folder<-args[1]
    if(folder == "."){
    stop("Please pass the name of the folder to process, not '.' .")
    }
    </code>


Next we call the code from `image-properties.r` to process each of the files in the folder the user named as an argument to the script.

    
    <code>
    ################################################################################
    ## Process the files
    ################################################################################
    ## Add more formats to taste. We need to only load image files though
    files<-list.files(folder, pattern="*.(jpg|jpeg|tif|tiff|png|gif|bmp)")
    stats<-filesSummaries(files, folder)
    </code>


Finally we call the code from `image-properties.r` to save the data to a file (named after the folder that has been processed by the script).

    
    <code>
    ################################################################################
    ## Write the data
    ################################################################################
    outfile<-file(paste(folder, ".txt", sep=""), "w")
    printFilesSummaries(stats, outfile)
    close(outfile)
    </code>

  

To run the code from the command line we have to set its execute file permission:

    
    <code>
    chmod +x imgstat
    </code>

  

And now we can generate statistical data about a folder of images ready to visualize.  
  
Here's an example of the output from the script:  


    
    <tt></tt>filename	imageID	year	hue_min	hue_1st_qu	hue_median	hue_mean	hue_3rd_qu	hue_max	hue_stdev	saturation_min	saturation_1st_qu	saturation_median	saturation_mean	saturation_3rd_qu	saturation_max	saturation_stdev	brightness_min	brightness_1st_qu	brightness_median	brightness_mean	brightness_3rd_qu	brightness_max	brightness_stdev
    1905.5_a_mondrian.jpg	1	NaN	0	51.43	55.29	60.23	65.71	330	16.5393230900438	0	0.232	0.2925	0.3066	0.3537	1	0.123994722897117	0.01176	0.2863	0.4549	0.4818	0.702	1	0.246702823821300
    1905.5_b_mondrian.jpg	2	NaN	0	36	40.47	94.86	192	360	90.020405312462	0	0.1333	0.2155	0.1979	0.2581	0.7143	0.0935518755834357	0.04314	0.2	0.6118	0.5523	0.8549	0.9725	0.312092338505255
    1905.5_c_mondrian.jpg	3	NaN	0	41.54	264	200.3	330	360	139.634180648185	0	0.141	0.2	0.2078	0.2644	1	0.0978851449446736	0.03137	0.08235	0.1608	0.2296	0.2667	1	0.216606346291597
    1905.5_d_mondrian.jpg	4	NaN	0	32	42	76.1	67.5	360	90.4207404627883	0	0.2308	0.306	0.3256	0.4	1	0.139508165859475	0.01569	0.1176	0.2627	0.3912	0.698	1	0.296420604122761
    1905.5_e_mondrian.jpg	5	NaN	0	72	124.3	135.3	217.2	345	65.5574296333988	0	0.1646	0.25	0.2706	0.3925	1	0.144880395319209	0.01569	0.2	0.3176	0.4501	0.8314	1	0.304302318390967
    1905.5_f_mondrian.jpg	6	NaN	0	48	56.84	85.65	70	360	74.8812889958008	0	0.05	0.1452	0.1937	0.3438	0.8333	0.153920183168041	0.01569	0.2863	0.4353	0.4846	0.7059	0.9725	0.242587145239624
    1905.5_g_mondrian.jpg	7	NaN	0	38.46	43.08	42.42	46.32	100	5.77930853730472	0	0.324	0.4706	0.4646	0.5972	1	0.164745255193285	0.01176	0.4196	0.5922	0.6044	0.8588	1	0.243507248302950
    1905.5_h_mondrian.jpg	8	NaN	0	40	47.14	54.34	60	360	25.19346977218	0	0.07547	0.1946	0.2287	0.3524	1	0.174754958215903	0.003922	0.2902	0.5882	0.5644	0.8157	0.9961	0.300666257269201

  
  


