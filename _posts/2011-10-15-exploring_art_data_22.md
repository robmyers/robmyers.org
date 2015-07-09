---
author: robmyers
comments: true
date: 2011-10-15 21:40:12+00:00
layout: post
slug: exploring_art_data_22
title: Exploring Art Data 22
wordpress_id: 1958
categories:
- Art Computing
- Art Open Data
---

So far we have used the R REPL to run code. Let's write a script that provides a command-line interface for the plotting code we have just written.  

A command-line interface allows the code to be called via the terminal, and to be called from shell scripts. This is useful for exploratory coding and for creating pipelines and workflows of different programs. It also allows code to be called from network programming systems such as Hadoop without having to convert the code.  

To allow the code to be called from the command line we use a "pound bang line" that tells the shell to use the Rscript interpreter rather than the interactive R system.  

`
    
    
    #!/usr/bin/env Rscript
    ## -*- mode: R -*-
    

`
Next we import the "getopt" library that we will use to parse arguments passed to the script from the command line.
`
    
    
    library('getopt')
    

`
And we import the properties-plot.r code that we will use to perform the actual work.
`
    
    
    source('properties-plot.r')
    

`
The first data and functions we write will be used to parse the arguments passed to the script by its caller. The arguments are defined in a standard format used by the getopt library.
`
    
    
    args<-matrix(ncol=4, byrow=TRUE,
    c('datafile',	'd', 	1,	"character",
    'imagedir',      'i',	1,	"character",
    'xcolumn',	'y',	1,	"character",
    'ycolumn',	'x',	1,	"character",
    'labelcolumn',	'c',	1,	"character",
    "xmin",          'm',     1,      "double",
    "xmax",          'M',     1,      "double",
    "ymin",          'n',     1,      "double",
    "ymax",          'N',     1,      "double",
    "plotwidth",     'p',     1,      "double",
    "plotheight",    'P',     1,      "double",
    "plotBorder",    'r',     1,      "double",
    "thumbwidth",    't',     1,      "double",
    "linewidth",     'l',     1,      "double",
    "linecol",       'L',     1,      "character",
    "pointsize",     'O',     1,      "double",
    "pointcol",      'C',     1,      "character",
    "labelsize",     'b',     1,      "double",
    "labelcol",      'B',     1,      "character",
    "axislabelx",    'e',     1,      "character",
    "axislabely",    'E',     1,      "character",
    "axiscol",       'z',     1,      "character",
    "axisround",     'Z',     1,      "integer",
    'outfile',       'o',     1,      "character",
    'help',	        'h',	 0,      "logical",
    'png',	        'G',	 0,      "logical",
    'pdf',	        'D',	 0,      "logical",
    'display',       'X',	 0,      "logical",
    'no-axes',       'S',     0,      "logical",
    'no-images',     'I',     0,      "logical",
    'no-labels',     'A',     0,      "logical",
    'no-points',     'T',     0,      "logical",
    'no-lines',      'V',     0,      "logical"))
    opt = getopt(args)
    

`
Now we have the arguments we can process them. We check for the presence of arguments to see whether the user has provided them by checking whether its value is not null.  

It's traditional to handle the help flag first.
`
    
    
    if(! is.null(opt$help)) {
    self = commandArgs()[1];
    cat(paste(getopt(args, usage=TRUE)))
    q(status=1)
    }
    

`
Next we check for required arguments, those arguments that the user must have provided in order for the code to run. Rather than checking each argument individually we list the required arguments in a vector and then check for their presence using set intersection. If the resulting set isn't empty, we build a string describing the missing arguments and use it to print an error message before exiting the script.  

`
    
    
    required<-c("datafile", "imagedir", "xcolumn", "ycolumn")
    checkRequiredArgs<-function(opts, required){
    missing<-setdiff(required, names(opts))
    if(length(missing) != 0){
    args<-paste("", missing, sep=" --")
    cat("Missing parameters:")
    cat(paste(missing))
    cat("\n")
    quit(status=1)
    }
    }
    

`
Then we set the global variables from properties-plot.r to the command line arguments that have been provided for them. We map the argument name to the variable name and then where it is present we use the assign function to set the variable.
`
    
    
    value.mappings<-matrix(ncol=2, byrow=TRUE,
    c("xmin", "minXValue",
    "linecol", "lineCol",
    "plotwidth", "plotWidth",
    "plotheight", "plotHeight",
    "plotBorder", "plotBorder",
    "thumbwidth", "thumbnailWidth",
    "linewidth", "lineWidth",
    "linecol", "lineCol",
    "pointsize", "pointSize",
    "pointcol", "pointCol",
    "labelsize", "labelSize",
    "labelcol", "labelCol",
    "axislabelx", "axisLabelX",
    "axislabely", "axisLabelY",
    "axiscol", "axisCol",
    "axisround", "axisRoundDigits"))
    valueOpts<-function(opts, mappings){
    for(i in 1:dim(mappings)[2]){
    mapping<-mappings[i,]
    if(! is.null(opts[[mapping[1]]])){
    assign(mapping[2], opts[[mapping[1]]], inherits=TRUE)
    }
    }
    }
    

`
Some arguments need to be set to a boolean value if a particular argument is present as a flag or not. We use a similar technique for this, but the matrix containing themapping from argument to variable also has a boolean value that is used to set the variable rather than fetching an argument value.
`
    
    
    boolean.mappings<-matrix(ncol=3, byrow=TRUE,
    c("no-images", "shouldDrawImages", FALSE,
    "no-points", "shouldDrawPoints", FALSE,
    "no-lines", "shouldDrawLines", FALSE,
    "no-labels", "shouldDrawLabels", FALSE,
    "no-axes", "shouldDrawAxes", FALSE))
    booleanOpts<-function(opts, mappings){
    for(i in 1:dim(mappings)[2]){
    mapping<-mappings[i,]
    if(! is.null(opts[[mapping[1]]])){
    assign(mapping[2], mapping[3], inherits=TRUE)
    }
    }
    }
    

`
The render type is specified through the arguments passed to the script, but we only want to perform one kind of render. We check that only one kind of render was specified or else we quit with an informative error message.
`
    
    
    renderTypeCount<-sum(as.integer(opt$pdf, opt$png, opt$display))
    if(renderTypeCount > 1){
    cat("Please specify only one of png, pdf or display to render\n")
    q(status=1)
    }
    

`
We get the file name to save the render as, if needed.
`
    
    
    getOutfile<-function(opt){
    if((! is.null(opt$display)) && is.null(opt$outfile)){
    cat("Missing parameter: --outfile|-o <filename>\n")
    q(status=1)
    }
    opt$outfile
    }
    

`
The last bit of configuration we get is the column to use for filenames in the data file, if it's provided, otherwise we default to "filename".
`
    
    
    getFilenameColumn<-function(opt){
    if(! is.null(opt$labelColumn)){
    opt$labelColumn
    } else {
    "filename"
    }
    }
    

`
The last function we define in the script performs the render specified in the arguments to the script.
`
    
    
    render<-function(opt){
    if(! is.null(opt$pdf)){
    ## render pdf
    pdfPlot(getOutfile(opt), opt$datafile, opt$imagedir, opt$xcolumn,
    opt$ycolumn, getFilenameColumn(opt))
    q(status=0)
    } else if (! is.null(opt$png)){
    ## render png
    pngPlot(getOutfile(opt), opt$datafile, opt$imagedir, opt$xcolumn,
    opt$ycolumn, getFilenameColumn(opt))
    q(status=0)
    } else {
    ## render display
    X11Plot(opt$datafile, opt$imagedir, opt$xcolumn, opt$ycolumn,
    getFilenameColumn(opt))
    ## Stop R exiting and closing the window straight away...
    Sys.sleep(3600000)
    }
    }
    

`
Finally, outside of any function, we call the functions we have defined in order to do the work of processing the parameters and calling the code.
`
    
    
    checkRequiredArgs(opt, required)
    valueOpts(opt, value.mappings)
    booleanOpts(opt, boolean.mappings)
    render(opt)
    

`
If we save this code in a file called propcli and make it executable using the shell command:  
  

chmod +x propcli  
  

We can call the script from the command line like this:  
  

./propcli --datafile images.txt --imagedir images --xcolumn saturation_median --ycolumn hue_median

