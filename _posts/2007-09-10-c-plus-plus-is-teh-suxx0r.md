---
author: robmyers
comments: true
date: 2007-09-10 01:49:05+00:00
layout: post
slug: c-plus-plus-is-teh-suxx0r
title: C Plus Plus Is Teh Suxx0r
wordpress_id: 1483
categories:
- Generative Art
- Satire
---

**const** I** const **don't **const** like **const** C++ **const**. **const**I use Lisp or JavaScript for my own work. I also use C, scheme and PHP occasionally. I have taught C and Java, and hacked Java and C++ professionally for years at a time. I have also done a lot of BASIC, Dylan, Objective-C, AppleScript and Python at one time or another.I can honestly say that C++ is the worst programming language I have ever used. Worse than Python, worse than AppleScript. There are a number of reasons for this:

  * The standard libraries require complex, irregular code to use and have many gotchas. Smalltalk, Java and the scripting languages are better.
  * The best thing you can say about the strings is that they are not as bad as Lisp strings. Even C strings are better.
  * The class and function system is complex and encumbers the user with premature design decisions. Java or Objective-C are better. Lisp's CLOS is heaven.
  * With C code, you know what will be created by any given code construct. C++ makes this random, polluting the namespace and codespace with random nonsense that may or may not include defaults.
  * C++ streams are a bit sucky. Using overloaded bitwise operators is funny for the first two minutes, but is a pain for the next few decades.
  * C++ is often sold as a systems programming language but it mangles exported symbols and has no shared library system. So it isn't any good as a systems programming language.
  * Idiots claim that C++ is fast. It is not fast unless you discard vtable dispatch, exceptions, RTTI, and new/delete. In other words C++ is fast if you use C instead.
  * C++ re-uses keywords like const in unpredictable and silly ways.
  * Const correctness is about as useful as Hungarian Notation.
  * If you have ever declared something to be a **friend**, you have discovered why C++'s encapsulation is not as good as CLOS. Or C.
  * The new coercion operators add complexity without making things any safer. You just have an extra four bad choices you can make.
  * No garbage collection but don't worry, no good memory management either.
  * References. Just everything about them.
  * A static typing system that will stop you doing only useful things.
  * The STL being value based. If you don't understand why that is bad then congratulations, you are one of the original authors!
So basically, use C if you want the good bits of C++, or a dynamic or functional programming language otherwise.Don't believe me? Here's Linus answering a C++ booster:[http://thread.gmane.org/gmane.comp.version-control.git/57643/focus=57918](http://thread.gmane.org/gmane.comp.version-control.git/57643/focus=57918)

<blockquote>_C++ is a horrible language. It's made more horrible by the fact that a lotof substandard programmers use it, to the point where it's much mucheasier to generate total and utter crap with it. Quite frankly, even ifthe choice of C were to do *nothing* but keep the C++ programmers out,that in itself would be a huge reason to use C.In other words: the choice of C is the only sane choice. I know MilesBader jokingly said "to piss you off", but it's actually true. I've cometo the conclusion that any programmer that would prefer the project to bein C++ over C is likely a programmer that I really *would* prefer to pissoff, so that he doesn't come and screw up any project I'm involved with.C++ leads to really really bad design choices. You invariably start usingthe "nice" library features of the language like STL and Boost and othertotal and utter crap, that may "help" you program, but causes:- infinite amounts of pain when they don't work (and anybody who tells methat STL and especially Boost are stable and portable is just so fullof BS that it's not even funny)- inefficient abstracted programming models where two years down the roadyou notice that some abstraction wasn't very efficient, but now allyour code depends on all the nice object models around it, and youcannot fix it without rewriting your app.In other words, the only way to do good, efficient, and system-level andportable C++ ends up to limit yourself to all the things that arebasically available in C. And limiting your project to C means that peopledon't screw that up, and also means that you get a lot of programmers thatdo actually understand low-level issues and don't screw things up with anyidiotic "object model" crap._</blockquote>

Technorati Tags: [hacking](http://www.technorati.com/tag/hacking)



