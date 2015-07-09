---
author: robmyers
comments: true
date: 2014-07-25 04:07:03+00:00
layout: post
slug: ethereum-art-market
title: Ethereum - Art Market
wordpress_id: 2597
categories:
- Art
- Ethereum
- Projects
---

Here is [a contract](https://gitorious.org/robmyers/artworld-ethereum/) that allows you to register as the owner of a digital artwork contained in a particular file (identified by its cryptographic hash value) at a particular URL. The use of a URL is inspired by the excellent [Monegraph](https://medium.com/message/a-bitcoin-for-digital-art-8c7db719e495), which launched shortly after I started working on Ethereum contracts for art. Monegraph uses the existing NameCoin system, which can be implemented in Ethereum as [a two line contract](https://github.com/ethereum/wiki/wiki/%5BEnglish%5D-White-Paper#identity-and-reputation-systems).

This contract is longer than that as it's recording and managing more information. It also allows you to offer the artwork for sale (in exchange for Ether, Ethereum's built-in currency), either to a specific individual or generally, or to transfer it to a specific individual without charging them within the contract.

    
    {
     (def 'next-record 0x10)
     (def 'RECORD-SIZE 64)
     ;; Next record position
     ;; This starts one cell above the maximum value of RipeMD
     [[next-record]] 0x10000000000000000000000000000000000000000
    
     (return
       0x0
       (lll
         {
          ;; Action
          ;; 0 - first cell in message
          [action] (calldataload 0)
          (when (= @action "register")
            {
             ;;TODO: Check correct message length
             ;;TODO: Check digest in range
             ;; Artwork digest
             [digest] (calldataload 32)
             ;; If already registered, don't continue
             (when @@ @digest
               (return "Arwork already registered."))
             ;; Get storage for new record
             [storage] @@next-record
             ;; Store digest
             [[@storage]] @digest
             ;; Artist account
             [storage] (+ @storage 1)
             [[@storage]] (caller)
             ;; Artist resale percentage
             [storage] (+ @storage 1)
             [[@storage]] (calldataload 64)
             ;; Artist is the current owner
             [storage] (+ @storage 1)
             [[@storage]] (caller)
             ;; Skip purchaser and price
             [storage] (+ @storage 3)
             ;; Copy over the url and description
             ;; 96 is 32 x 3 = 3rd cell in message
             [source] 96
             (for [i] 6    (< @i 64)    [i] (+ @i 1)
                  {
                   [[@storage]] (calldataload @source)
                   [storage] (+ @storage 1)
                   [source] (+ @source 32)
                   })
             ;; Store digest-to-record link
             [[@digest]] @@next-record
             ;; Increment next record position
             [[next-record]] (+ @@next-record RECORD-SIZE)
             })
          (when (= @action "offer")
            {
             ;;TODO: Check correct message length
             ;;TODO: Check digest in range
             ;; Get artwork record storage for digest or stop
             ;; 32 = second cell in message
             [storage] @@(calldataload 32)
             (when (not @storage)
               (return "Artwork not registered."))
             ;; If the caller is the owner
             (when (= @@ (+ @storage 3) (caller))
               {
                ;; Offer subject
                [[(+ @storage 4)]] (calldataload 64)
                ;; Offer price
                [[(+ @storage 5)]] (calldataload 96)
                })
             })
          (when (= @action "accept")
            {
             ;;TODO: Check correct message length
             ;;TODO: Check digest in range
             ;;TODO: Error messages for bad price or buyer
             ;; Get artwork record storage for digest or stop
             ;; 32 = second cell in message
             [storage] @@(calldataload 32)
             (when (not @storage)
               (return "Artwork not registered."))
             [buyer] @@(+ @storage 4)
             [price] @@(+ @storage 5)
             ;; If the caller is the buyer and it's the correct payment
             ;; Or there's no buyer and it's the correct nonzero payment
             (when (|| (&& (= @buyer (caller))
                           (= @price (callvalue)))
                       (&& (= @buyer 0)
                           (> @price 0)))
               {
                ;; For payment
                ;; Ethereum doesn't allow fractional amounts
                ;; Warn users about making prices divisible
                [hundredth] (/ @price 100)
                [arr] @@(+ @storage 2)
                ;; Pay artist
                (call (- (gas) 250) @@(+ @storage 1) (* @hundredth @arr) 0 0 0 0)
                ;; Pay owner
                (call (- (gas) 250) @@(+ @storage 3) (* @hundredth (- 100 @arr)) 0 0 0 0)
                ;; Transfer ownership
                [[(+ @storage 3)]] (caller)
                ;; Clear offer subject and price
                [[(+ @storage 4)]] 0
                [[(+ @storage 5)]] 0
                })
             })
          }
         0x0))}
    


Here's the top and the bottom of the main UI (implemented in HTML and JavaScript for the AlethZero Ethereum client).

[![registry1](/assets/2014/07/registry1.png)](/assets/2014/07/registry1.png)
[![registry3](/assets/2014/07/registry3.png)](/assets/2014/07/registry3.png)
You can enter a URL and get the cryptographic hash for it.

[![registry2](/assets/2014/07/registry2.png)](/assets/2014/07/registry2.png)
If the artwork has already been registered, this will show its details.

[![registry5](/assets/2014/07/registry5.png)](/assets/2014/07/registry5.png)
Or if not you can register it.

[![registry4](/assets/2014/07/registry4.png)](/assets/2014/07/registry4.png)
Once you've registered an artwork you are the artist of it and you also own it. You can offer any artwork you own for sale.

[![registry6](/assets/2014/07/registry6.png)](/assets/2014/07/registry6.png)
And you can accept a sale offer, paying the specified amount of Ether.

[![registry7](/assets/2014/07/registry7.png)](/assets/2014/07/registry7.png)
The UI warns you how much Ether you are about to spend.

[![registry8](/assets/2014/07/registry8.png)](/assets/2014/07/registry8.png)
And when you buy an artwork it lets you know when the transfer is complete.

[![registry9](/assets/2014/07/registry9.png)](/assets/2014/07/registry9.png)
It's a market in [allographic](/2013/09/09/allographic-fake-information-materiality/) digital art. In contrast to the existing art market it is entirely public and transparent. And in contrast to many jurisdictions it implements the controversial "Artist's Resale Right" in a voluntary way (in a way similar to that suggested in "[The Social Lives of Artistic Property](http://booktype-demo.sourcefabric.org/the-social-lives-of-artistic-property/ownership-for-artists/)"). If it's prohibitively difficult to experiment in the existing art market, we can make new markets for new kinds of art. Like this one.
