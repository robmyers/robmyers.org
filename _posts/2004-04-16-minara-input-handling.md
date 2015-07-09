---
author: robmyers
comments: false
date: 2004-04-16 06:45:14+00:00
layout: post
slug: minara-input-handling
title: 'Minara: Input Handling'
wordpress_id: 122
categories:
- Projects
---

I've been working on keymaps and tool handling for Minara. Keymaps are Emacs' way of handling input. Tool event hooks are a more GUI-ish way of doing things. I was worried they'd clash, but they form natural layers. So raw input is handled by event hooks, actually by an event protocol (like Dylan's iteration protocols: a list of functions). The keyboard handling hooks can then use a standard keymap facility if they want to or provide their own functionality.  
It's a nicely layered approach that hopefully gets the best of both worlds.

  


