---
author: robmyers
comments: true
date: 2015-01-10 22:51:05+00:00
layout: page
slug: tate-data-visualization
title: Tate Data Visualization
permalink: /tate-data-visualization/
wordpress_id: 2732
---

[![Movements Since 1800](/assets/2014/02/unnamed-chunk-4.png)](/assets/2014/02/unnamed-chunk-4.png)

**Exploring Tate Art Open Data, 2014, JavaScript and R code.**

Why visualise the Tate’s collection dataset?

The Tate is the UK’s largest art institution. The free and open release of Tate’s collection data shows just how far open data has come in the last decade, and makes a major resource available for study. This resource allows us to follow two lines of investigation.

The first is into the history of art, using the Tate’s collection as a model of art in general, particularly of British art. The Tate’s collection data describes the form, content, attribution and dates of a sample of art from the past several hundred years. This is a history of art, and as long as we place it in its historical context it can be a useful one.

The second is institutional critique, to analyse the Tate’s collection and contrast it with other collections and with other models of the history of art (verbal, data-based or otherwise). Rather than allowing or controlling for the historical context of the data this makes recovering and examining that context the focus.

It’s possible to succeed or fail at each, and neither requires taking the claims of Museums to represent history or of data to represent reality at face value or in a vacuum. Data visualisation and statistical analysis are ways of dealing with datasets that would take a human reader many years to examine. They are forms of rhetoric, but they are also useful tools.

With suitable modesty of aims and suitable reflection on the historical and political contexts which have given rise to our tools and materials, let us begin…

(From /2014/02/19/exploring-tate-art-open-data-0/)

You can see the results here:

    
    <code>              name         gender                 dates     
     Bateman, James :   2         : 112   dates not known:  59  
     Doyle, John    :   2   Female: 521   born 1967      :  42  
     Hone, Nathaniel:   2   Male  :2894   born 1936      :  38  
     Peri, Peter    :   2                 born 1930      :  36  
     Stokes, Adrian :   2                 born 1938      :  36  
     Wilson, Richard:   2                 born 1941      :  34  
     (Other)        :3515                 (Other)        :3282  
      yearOfBirth    yearOfDeath                      placeOfBirth 
     Min.   :1497   Min.   :1543                            : 491  
     1st Qu.:1855   1st Qu.:1874   London, United Kingdom   : 446  
     Median :1910   Median :1944   Paris, France            :  57  
     Mean   :1887   Mean   :1920   Edinburgh, United Kingdom:  47  
     3rd Qu.:1941   3rd Qu.:1982   New York, United States  :  43  
     Max.   :2004   Max.   :2013   Glasgow, United Kingdom  :  35  
     NA's   :57     NA's   :1309   (Other)                  :2408  
                        placeOfDeath 
                              :2079  
     London, United Kingdom   : 442  
     Paris, France            :  82  
     New York, United States  :  45  
     Roma, Italia             :  22  
     Edinburgh, United Kingdom:  18  
     (Other)                  : 839  
    </code>


[/2014/02/05/exploring-tate-art-open-data-1/](/2014/02/05/exploring-tate-art-open-data-1/)

[![Movements Connected By Artists](/assets/2014/02/unnamed-chunk-9.png)](/assets/2014/02/unnamed-chunk-9.png)

[/2014/02/08/exploring-tate-art-open-data-2/](/2014/02/08/exploring-tate-art-open-data-2/)

You can find details for how to get the source code on those pages.
