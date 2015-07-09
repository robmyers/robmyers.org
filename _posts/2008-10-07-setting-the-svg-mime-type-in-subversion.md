---
author: robmyers
comments: true
date: 2008-10-07 07:40:48+00:00
layout: post
slug: setting-the-svg-mime-type-in-subversion
title: Setting the SVG MIME Type in Subversion
wordpress_id: 1679
categories:
- Howto
---

If you have directories containing SVG files that you wish to add to a Subversion repository and you wish them to display as images rather than XML when someone broswes the repository in a web broswer, run the following in the local parent directory then commit it:  
  
svn propset svn:mime-type image/svg+xml */*.svg  
  


