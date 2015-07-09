---
author: robmyers
comments: true
date: 2008-06-20 04:59:42+00:00
layout: post
slug: how-vrml-2-destroyed-internet-vr-for-a-decade
title: How VRML 2 Destroyed Internet VR For A Decade
wordpress_id: 1612
categories:
- Generative Art
---

In the mid-1990s there were four problems with internet-based Virtual Reality (VR).  
  
1. The plug-ins were all for Windows, not Mac. Ignoring early adopters and designers is a bad idea when launching a new visual medium.  
  
2. People's PCs had anaemic graphics cards and processors. Skilful design could offset this, though.  
  
3. People were on 24-56k dial-up modems for the most part. Again, skilful design could offset this but it did set a limit.  
  
4. VRML 2 was an unimplementable turd of a standard. It destroyed any company that tried to implement it.  
  
I think people underestimate the Mac angle. Apple had a miniscule market share but Macs were disproportionately represented on the Internet and within that there were a disproportionate number of the kinds of people you need making and consuming your new medium if you want it to succeed. But I digress.  
  
Reading the VRML 2 standard when it first came out I was struck by its complexity and by the naivete of some of the implementation notes. I couldn't see how to implement it without much more work than the notes seemed to suggest was needed.  
  
Events showed my concerns to be well founded. Cosmo, SGI's VR outfit, was spun off and failed before they managed to finish implementing VRML 2. Intervista also failed to implement it and got bought out. A trend was emerging. Try to implement VRML 2, fail, lose your company.  
  
VRML 1 had been OK. Black Sun had based a multi-user VR system on it. It would have been better for VRML 2 not to have been specified and for VRML 1 to remain the standard with external animation added by the likes of Black Sun than for VRML 2 to destroy the industry.  
  
A couple of years ago the corpse of VRML 2 was exhumed and wrapped in XML to produce X3D. The problem with VRML 2 was not that it wasn't verbose enough, and wrapping it in an extra layer of verbosity in the form of XML tackled the wrong problem. As a comparison, SVG is basically PDF in XML but it is easier to parse than PDF and better suited to inline web graphics because of the choices that were made when considering which bits of PDF should be included or left out.  
  
VRML 2 played a unique part in the failure of the first wave of Internet virtual reality. It wasn't until the mid-2000s that a second wave arrived with less powerful scene description than VRML 1 and a walled-garden, service-based approach that is at odds with the freedom of the hypertext internet that VRML sought to extend.  
  
I long for the return of internet virtual reality based on open standards, distributed client-server systems, and text-file-hackability. With meshes.  


