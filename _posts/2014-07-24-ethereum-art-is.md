---
author: robmyers
comments: true
date: 2014-07-24 05:07:01+00:00
layout: post
slug: ethereum-art-is
title: Ethereum - Art Is...
wordpress_id: 2594
categories:
- Aesthetics
- Art
- Art Computing
- Ethereum
- Projects
---

Here is a contract that allows anyone to define what art is. It contains a single set of twelve statements about art. They are encoded as hexadecimal values which are interpreted as sentences in a simple subset of International Art English and displayed by the UI.

    
    {
     ;; Constant values
     ;; Price base (wei), doubled for each definition up to DEFS-COUNT
     (def 'PRICE-BASE 10)
     ;; Add to the index to get the price base exponent
     (def 'PRICE-FACTOR-ADD 10)
     ;; Number of definitions
     (def 'DEFS-COUNT 12)
     ;; Range of values for definitions
     (def 'DEF-MIN 0x1)
     (def 'DEF-MAX 0x0F0F0F0F)
    
     ;; Storage locations
     (def 'artist 0x10)
     (def 'defs-base 0x100)
     (def 'theorists-base 0x200)
    
     ;; State
     ;; Contract owner/payee
     [[artist]] (caller)
    
     (return
       0x0
       (lll
         {
         [action] (calldataload 0)
          (when (= @action "set")
            {
             [index] (calldataload 32)
             [definition] (calldataload 64)
             [price] (exp PRICE-BASE (+ @index 1 PRICE-FACTOR-ADD))
             ;; If the index is in range and the caller paid enough to set it
             (when (&& (>= @definition DEF-MIN)
                       (<= @definition DEF-MAX)
                       (< @index DEFS-COUNT)
                       (= (callvalue) @price))
               {
                ;; Update definition
                [[(+ defs-base @index)]] @definition
                [[(+ theorists-base @index)]] (caller)
                (- (gas) 100) @@artist @price 0 0 0 0
                })
             })
          }
         0x0))
     }
    


The contract is in lll rather than Serpent this time.

Here's what the UI looks like.
[![art_is1](/assets/2014/07/art_is1.png)](/assets/2014/07/art_is1.png)
And here's what it looks like when a statement is being edited.
[![is_art2](/assets/2014/07/is_art2.png)](/assets/2014/07/is_art2.png)
The contract allows the statements to be edited but it costs progressively more to do so: the first costs 10 Wei, the third costs 1000 and so on. This ensures that art theorists place a value on their definition, thereby indicating how confident in and/or serious about their definition they are. The higher the value, the less likely it is to be changed by someone else. This combines art theory with behavioral economics.
