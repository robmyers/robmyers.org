---
author: robmyers
comments: false
date: 2003-04-25 00:20:42+00:00
layout: post
slug: bitfastness
title: Bitfastness
wordpress_id: 22
categories:
- Generative Art
---

Programming in Perl or Java is the conservational equivalent of painting with household gloss. For software, conservation means being able to run the program. Targeting specific systems or fashionable languages (Windows XP or Perl) will not immediately cause problems beyond limiting distribution, but when the targeted hardware starts breaking and the system or language used is no longer current or even maintained, work is left unexhibitable.  
In the worst case, decades from now, software artworks will be completely incompatible with contemporary systems and they will have to be remade from source code. The language used should therefore have shown longevity and be easy to re-implement. To make it suitable for programming in the first place, the language should be expressive and should be Turing complete.  
The oldest languages still in widespread use are FORTRAN, Lisp and COBOL. Lisp is the most general-purpose language of the three, but the current Lisp standard (Common Lisp) is too complex to be easily re-implemented. There is however a more lightweight version of Lisp available called Scheme. Scheme is easy to implement yet powerful enough to use for real-world programming. Scheme interpreters and compilers are available for most operating systems, and a Java-cross compiler (KAWA) is also available.  
Archival quality ("bitfast") code should use well-commented and well-structured Scheme, with LIDL (a portable library suite) and a CLOS-like (object-oriented) library if required. Graphical and other interfaces should be written as needed, kept as simple as possible, and thoroughly documented. The code, its documentation, the libraries, the language standard and sample output in a raw format (also documented) should be provided on archival CD. These measures will make software art conservation a more realistic prospect than it is for much currently produced work.



