---
author: robmyers
comments: true
date: 2014-10-31 19:22:15+00:00
layout: post
slug: contemporary-art-daily-text-analysis
title: Contemporary Art Daily Text Analysis
wordpress_id: 2646
categories:
- Art Computing
- Art History
- Digital Art History
- Projects
---

[![cad-wordcloud](/assets/2014/10/cad-wordcloud.png)](/assets/2014/10/cad-wordcloud.png)Contemporary Art Daily (CAD) is a leading contemporary art blog that publishes documentation for selected shows of contemporary art. It was started in 2008 by then art student Forrest Nash, who describes the site as follows:


<blockquote>Contemporary Art Daily is a website that publishes documentation of at least one contemporary art exhibition every day. We have an international purview, and we work hard to get especially high-quality documentation of the shows we publish.</blockquote>


Since 2008 CAD has published the details of more than 1800 shows including descriptive text, images of works included, and lists of artists involved in each show.

Nash describes the criteria used for selecting that documentation as follows:


<blockquote>Our criteria for Contemporary Art Daily is complicated and not perfectly reducible, but I like to say that we are generally trying to balance two motives that sometimes conflict with each other. On the one hand, we do have a kind of journalistic motive: we hope to in some way represent the breadth of what is happening in contemporary art, even when a particular artist is not of personal interest to us. On the other hand, we have a curatorial motive, to advance art we believe in and think is important. I am usually more concerned about making a mistake and failing to see or include something than I am accidentally letting something through the filter that doesn’t belong.</blockquote>


(from: [http://metropolism.com/features/why-contemporary-art-daily/](http://metropolism.com/features/why-contemporary-art-daily/)).

As a curated resource, CAD is not a statistically representative population sample of all available contemporary art shows. Like a museum collection, a survey show or a textbook it is a mediated, value-laden view of the artworld. Its popularity demonstrates the appeal of this particular view to contemporary artworld audiences. Analyzing CAD is therefore a way of gaining an insight into one popular view of the contemporary artworld.

The html code of [www.contemporaryartdaily.com](http://www.contemporaryartdaily.com) was downloaded in January 2014 and processed with an R script to extract text and information from each post on the site announcing a show that fits their standard format. This data was then loaded by the R code in this file to generate the report you are now reading. For reasons of practicality and clarity Some analysis has been performed on the entire dataset, some on just the most popular entities (…most frequently occurring values) within it.

The presence or absence of surprises in the data may indicate fidelity or bias in the worldview of either Contemporary Art Daily or of the online contemporary artworld audience in relation to each other. The extent to which this generalizes to the culture or the reality of the wider contemporary artworld is open to question. Comparing CAD to the data of a more general art show resource website would provide evidence for this but is outside the scope of the current study. The reader's intuition will have to suffice on these matters for now.

You can download an archive of the report here in several formats, the html version is by far the best:

[Click here to download](/assets/2014/10/cad-text-analysis.zip)

The source code is available here:

[https://gitorious.org/robmyers/contemporary-art-daily-analysis/](https://gitorious.org/robmyers/contemporary-art-daily-analysis/)


