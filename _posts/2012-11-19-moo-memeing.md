---
author: robmyers
comments: true
date: 2012-11-19 22:51:25+00:00
layout: post
slug: moo-memeing
title: MOO Memeing
wordpress_id: 2268
categories:
- LambdaMOO
- Satire
---

@verb me:lick this none none
    @program me:lick


if (this.location != player.location)
  lickfail = "You must be in the same location as %t to lick %[dpo].";
  player:tell($string_utils:pronoun_sub(lickfail));
elseif (this == player)
  lick = "You lick yourself. Mmm! You taste just like raisins.";
  player:tell($string_utils:pronoun_sub(lick));
  licks = "%N %<licks> %r. Mmm! %[dpsc] %<d:tastes> just like raisins.";
  player.location:announce_all_but({player}, $string_utils:pronoun_sub(licks));
else
  lick = "You lick %t. Mmm! %[dpsc] %<d:tastes> just like raisins.";
  player:tell($string_utils:pronoun_sub(lick));
  licks = "%N %<licks> %t. Mmm! %[dpsc] %<d:tastes> just like raisins.";
  but = {this, player};
  player.location:announce_all_but(but, $string_utils:pronoun_sub(licks));
  licked = "%N %<licks> you. Mmm! You taste just like raisins.";
  this:tell($string_utils:pronoun_sub(licked));
endif

    
    .
