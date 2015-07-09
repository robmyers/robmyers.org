---
author: robmyers
comments: true
date: 2009-02-05 00:44:42+00:00
layout: post
slug: gutenberg-cd-to-plucker-perl-script
title: Gutenberg CD To Plucker Perl Script
wordpress_id: 1715
categories:
- Art Computing
- Free Culture
- Howto
---

<pre>#!/usr/bin/perl# Copyright (c) 2009 Rob Myers <rob@robmyers.org># Licenced under the GPL version 3 or, at your option, any later version.# Install gut (gutenberg to html converter) into your PATH.# Download the project Gutenberg CD image, decompress it,# add this file to the directory contaning the etext directories and run it.use strict;use warnings;use File::Basename;use Cwd;sub html_name{my $filename = shift @_;$filename =~ s/(.*).txt/$1.html/;$filename;}sub absolute_path{my $file = shift @_;"file://" . Cwd::cwd() . "/" . $file;}sub html_to_pdb{my $file = shift @_;my $absolute_file = absolute_path ($file);my $file_root = basename ($file);system ("plucker-build  --zlib-compression --stayonhost --bpp=8 -p./plucker -f $file_root $absolute_file");}sub txt_to_html{my $filename = shift @_;my $htmlname = html_name ($filename);`cat $filename | gut > $htmlname`;}sub process_files{my @txt_files = `ls ./etext*/*.txt`;foreach my $file (@txt_files){chomp ($file);# Don't convert files that have an html versionmy $htmlfile = $file;$htmlfile =~ s/(.*).txt/$1h.htm\*/;if (! -f $htmlfile){txt_to_html ($file);}}my @html_files = `ls etext*/*.html etext*/*.htm`;foreach my $file (@html_files){chomp ($file);html_to_pdb ($file);}}mkdir ("./plucker");process_files ();</pre>

