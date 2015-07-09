---
author: robmyers
comments: true
date: 2012-07-21 04:07:52+00:00
layout: page
slug: minara
title: Minara
permalink: /minara/
wordpress_id: 2008
---

## overview

![](/assets/2012/07/shape_tools.jpg)

Minara is free software, released under the GPL.


## status

  * **current - **Minara development is on hiatus but will continue in August 2006 with preparation for release 0.1 .

  * **july 2006 - **Picking and dragging now work. Preparation for 0.1 will begin in August.

  * **june 2006 - **Picking now works. I just need to get the transform tracing working and dragging will work. Then it's just bug fixes, packages and more demo tools (not a full bezier pen) to hit 0.1 in August!

  * **april 2006 - **I'm finishing picking and working on dragging as a step towards implementing copy & paste.

  * **november 2005 - **I implemented drawing tools: circle, square, rectangle, polyline, star. I hacked up a couple of demos of more generative tools: Subjects and a random walk scribble. I added a minibuffer system and a simple RGB colour picker. I also showed minara to around a hundred people at [Dorokbot London 34.](http://www.dorkbot.org/dorkbotlondon/20051121.html)

  * **october 2005 - **I implemented the view tools, zoom and pan.

  * **september 2005 - **I got basic undo (z) and redo (Z) working. The undo system has ended up very similar to Emacs's. I changed the matrix system to use OpenGL matrices rather than calculating transformations in Scheme.

  * **may 2005 - **I'm working on picking. The code for line and bezier intersection is terrible, but it works for proof-of-concept.

  * **march 2005 - **I tidied up the code, reformatting it and renamed functions to better fit the GNU coding standards. I also made some Scheme file fixes.

  * **december 2004 - **Minara is sticking with OpenGL; adding an intersection callback stopped the crashes. I've cleaned up the buffer and window code, and started working on code to support transforms using PostScript-style matrices for speed (2x3 rather than 3x3). You can also save buffers now (type x,s). The C cleanup can wait. I need to think some more about transforms, and also about dialog-style interactions with the user. Minara needs to prompt for filenames and to display colour choices and other dialog functionality. I don't want to reinvent the wheel, but I do want something that will look good and be fast for power-users to operate.

  * **october 2004 - **I've checked the latest version (featuring last month's changes) in to SourceForge. The basic window, buffer and tool systems are now running well, and the toy pen tool doesn't always crash GLUT's polyline intersector. ;-)

  * I'm going to get back to Minara in December or January for a major clean-up of the buffer code, converting the rendering code to using LibArt, and reformatting the C code to follow GNU coding standards.

  * **september 2004 (2) - **The test framework has helped debug buffer operations and the tool system, and I now have a simple tool that draws directly into the main program buffer. Image above.

  * This is just a couple of steps away from the pen tool. I'm hitting the limitations of my current bezier drawing system, though. I may have to switch to Libart or Cairo, although I'd rather stick with raw OpenGL.

  * I've also written a tool to convert PostScript to Minara format without using pstoedit. It's written in PostScript.

  * **september 2004 - **Finding s-expressions in buffers of code in order to match picked entities is coded (no macro expansion yet), and I'm translating the test framework from rob-art into Scheme to speed up debugging the code. Next up is the pen tool, but I've a lot of consolidation and testing to do before then. It will still be several months to the next pre-alpha.

  * I couldn't wait that long so I finished the first part of 1968 in the rapidly maturing Inkscape SVG editor.

  * **may 2004 - **I lied. I'm working on picking and colour. This is so I can use Minara to edit my project "1968". Hopefully working on a real project will help Minara start to mature just a little.

  * I will need to finish menus and keymaps to have something to enable picking and colouring from, though. And I must get the changes into SourceForge when I've finished adding the current round of features.

  * **april 2004 - **I'm working on menus. GLUT menus seem to be attached to the mouse as contextual menus, which is quite nice. I'm also working on keymaps. These are much simpler than emacs' keymaps, but will be useful to select and control tools quicker than menu options.

  * Next up is transformation matrices and basic tool handling. Yes, I said that last time as well. :-)

  * **feb 2004 - **I've re-written the renderer to use raw OpenGL, the application to use GLUT rather than SDL, and the buffers to use Scheme rather than libtext. This removes dependencies on third-party libraries and makes the code simpler & more manageable. I've also refactored the application code so most of the work is done in Scheme rather than C, which makes code changes faster to make and easier to test. It should also improve configurability. And I've implemented the GNU build system so the source in CVS should build with ./bootstrap && ./configure && make on any platform with autoconf/automake installed, including MacOS X.

  * I've written utilities to convert PostScript code to and from Minara format, which means once they're fully tested Minara will be an image viewer for its own format. :-)

  * Next up is transformation matrices and basic tool handling.

  * **jan 2004 - **I've written the most basic part of the application: the scripting and rendering shell, and that is now in SourceForge CVS.

  * Next up is basic buffers.


## the name

Minara stands for "Minara Is Not A Recursive Acronym". Recursive acronyms aren't funny, and giving software feminine names is silly. It's pronounced "min-are-ah" (not "mine-a-ray"). If there are any namespace pollution problems Minara will be renamed Inara (Inara's Not A Recursive Acronym) or some other variant of the two with a different first letter that doesn't offend anyone's lawyers.


## technology

Minara is programmed in C using libguile, OpenGL and GLUT.

Guile is the GNU project's standard scripting language, an implementation of the Scheme and Elisp dialects of Lisp. Lisp has been a cutting-edge programming language for almost fifty years with a proven track record in architectural, design and media scripting. Lisp treats code and data interchangeably and is easily extensible, both important for a language that is being used both as a graphics format and a graphics language. ECMAScript was considered because of its use in web scripting, but this familiarity does not outweigh Lisp's advantages. Python was
__not__.seriously = considered;

OpenGL is the industry standard for real-time 3D graphics and it is also a powerful cross-platform 2D graphics engine. Using OpenGL allows cross-platform hardware-accelerated 2D rendering and blitting.

GLUT has been chosen as it provides a platform-independent OpenGL application shell that does not tie Minara to a particular GUI system.


## the editor

Files are stored as Lisp code in an Emacs-style text buffer, operated on by tools (and the user in an editor) as text, then rendered by Minara's rendering engine. This approach has been chosen for its simplicity and because it allows Minara graphics to contain arbitrary code.


## picking

Picking objects causes a window's script buffer to be executed in a namespace with the drawing command names bound to selection operations rather than graphics operations. Selected objects' text buffer ranges are stored in the list of currently selected objects for the buffer. Tools have access to this list and can replace, insert into, delete or transform its contents (or any other point in the file for that matter).


## tools

Tools are loaded from file as Lisp code in the same dialect of Lisp as Minara graphics files. They can be selected in the user interface, and they can register for different event hooks at different times in their lifecycle. Drawing tools usually simply add code to the end of their buffer then add this to the current window script buffer to commit their changes. Other tools may operate on ranges of the window script buffer fetched from the pick list, or search and replace in the file.


## rendering model

The traditional "Postscript" path model is used, but with a full 3x3 transformation matrix. For practical and ideological reasons strokes are not supported: a stroke is a shape created by offsetting a path. Colour spaces are arbitrary: a file may use as many or as few component colours as it requires. "Colours" are shaders: they may be flat colours, OpenGL-style specular/diffuse/reflective colours or programmatic shaders. A Minara artwork is basically a chain of shaders: source, transform, material and render shaders.


## file format

Minara stores illustrations as Lisp files, the same Lisp code operated on in the buffer. This is a simple and flexible representation that loads directly into Minara without the overhead and limitations of a pre-press, interchange or screen format. Minara graphics files can easily be translated to PostScript, PDF, SVG and other formats by writing libraries that redefine the Minara graphics commands to output the desired file format rather than rendering to the screen, am application to do this has been written. Conversion of other formats to Minara files is also simple, a driver for pstoedit to convert PostScript files to Minara files has been written.
