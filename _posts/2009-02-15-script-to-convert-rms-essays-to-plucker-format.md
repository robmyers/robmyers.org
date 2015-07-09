---
author: robmyers
comments: true
date: 2009-02-15 13:41:05+00:00
layout: post
slug: script-to-convert-rms-essays-to-plucker-format
title: Script to Convert rms-essays to Plucker Format
wordpress_id: 1726
categories:
- Free Culture
- Howto
- links
---

#!/bin/bash<br></br><br></br># Copyright 2009 Rob Myers <rob@robmyers.org><br></br># Licenced under the GPL 3 or, at your option, any later version.<br></br><br></br># Produce a Plucker version of Free Software, Free Society<br></br># Some texinfo errors not fixed<br></br><br></br># Convert eps images to GIFs<br></br><br></br>convert images/clib.eps images/clib.gif<br></br>convert images/code.eps images/code.gif<br></br>convert images/flex.eps images/flex.gif<br></br>convert images/free_software_song.eps images/free_software_song.gif<br></br>convert images/headMain.eps images/headMain.gif<br></br>convert images/party.eps images/party.gif<br></br>convert images/richard.eps images/richard.gif<br></br>convert images/philosophical-gnu.eps images/philosophical-gnu.gif<br></br><br></br># Fix texinfo problems<br></br><br></br>perl -pe 's/@heading\{(.*)\}/@heading $1/' -i fs_for_freedom.texi <br></br><br></br>perl -pe 's/^\\input texinfo_times.tex//' \<br></br>    -i rms-essays.texi<br></br><br></br>echo "\<br></br>@ifnottex<br></br>@alias unnumberedfootnote = footnote<br></br>@end ifnottex<br></br><br></br>@ifnottex<br></br>@macro sp1<br></br>@sp 1<br></br>@end macro<br></br>@end ifnottex<br></br><br></br>@include rms-essays.texi<br></br>" > rms-essays-html.texi<br></br><br></br># Convert to plucker<br></br><br></br>makeinfo --html --no-headers --no-split --force -o rms-essays.html \<br></br>    rms-essays-html.texi<br></br><br></br>perl -pe 's/^(<a href="#.+)$/$1<br \/>/' \<br></br>    -i rms-essays.html<br></br><br></br>plucker-build --zlib-compression --stayonhost --bpp=1 --maxwidth=320 -p . \<br></br>    -f rms-essays -N "Free Software,Free Society" file://`pwd`/rms-essays.html



