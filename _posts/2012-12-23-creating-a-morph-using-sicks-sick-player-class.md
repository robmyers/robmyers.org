---
author: robmyers
comments: true
date: 2012-12-23 22:53:48+00:00
layout: post
slug: creating-a-morph-using-sicks-sick-player-class
title: Creating A Morph Using Sick's Sick Player Class
wordpress_id: 2274
categories:
- LambdaMOO
---

Once you've set your LambdaMOO character's description using `@describe me as`, set its gender using `@gender` and set Sick's Sick Player Class as your character's parent using `@chparent me to #49900` you can add morphs to them.

A morph is an alternate identity for your character. It bundles together an alias, description and other properties describing a character so you can save them and then switch to them quickly later.

Before creating any morphs you should save your character's initial state by typing:

`@save-morph`

Then each time you change your character description or any morphs you should type it again.

The command for creating a morph is:

`@create-morph <morph-gender> <morph-name> as <morph-description>`

where gender is one of the standard LambdaMOO genders and morph-description is a description of the character's appearance contained in double quotes.

You can then switch to the new morph by typing:

`@morph <morph-name>`

And you can switch back to your character's original name and description by typing:

`@morph <character-name>`

Then whatever your character's current morph you can create further morphs using `@create-morph`.

There's much more you can do with morphs. The documentation for morphing can be found using the help command:

`help morphing`


