---
author: robmyers
comments: true
date: 2011-01-26 23:04:25+00:00
layout: post
slug: exploring_art_data_15
title: Exploring Art Data 15
wordpress_id: 1917
categories:
- Art History
- Art Open Data
---

Let's find an art historical data source that hasn't already been digitised and made freely available.  
  
Graves' Art Sales is often referred to in economic studies of art history. It is in the public domain but isn't (at the time of writing) available to download from any of the public domain text repository projects. Fortunately, copies of early-1970s facsimiles (also out of copyright) are available through online booksellers.  
  
While waiting for the first volume to be delivered, I made a very simple homebrew book scanner. It's a cardboard box cut in half, a bright lamp, a sheet of glass and cheap digital camera camera on a tripod. The design is from [http://www.diybookscanner.org/](http://www.diybookscanner.org/) , which also has more sophisticated designs available.  
  
The scanner with volume one of Graves in place ready for scanning:  
  
[![IMG_20110126_224748.jpg](/assets/assets_c/2011/01/IMG_20110126_224748-thumb-300x398-66.jpg)](/weblog/assets_c/2011/01/IMG_20110126_224748-66.html)  
  
Here's the book:  
  
[![IMG_20110126_224707.jpg](/assets/assets_c/2011/01/IMG_20110126_224707-thumb-400x301-69.jpg)](/weblog/assets_c/2011/01/IMG_20110126_224707-69.html)  


  
We'll scan the pages containing the data of Constable's sale prices. This is a simple (but slow) matter of photographing first all the front sides of those pages in turn, then turning the book around and photographing all the back sides. This makes scanning faster but does mean that the pages are out of order. Since we are only using a few pages here, we can rename them manually but there are scripts to help do this for entire books.  
  
A scanned page:  
  
[![ALIM0005.JPG](/assets/assets_c/2011/01/ALIM0005-thumb-400x300-72.jpg)](/weblog/assets_c/2011/01/ALIM0005-72.html)  
  
To rotate and clean up the pages we will use a piece of software called Scan Tailor ([http://scantailor.sourceforge.net/](http://scantailor.sourceforge.net/)). After processing in Scan Tailor, the above page looks like this:  
  
[![ALIM005.png](/assets/assets_c/2011/01/ALIM005-thumb-300x311-78.png)](/weblog/assets_c/2011/01/ALIM005-78.html)  
We can extract the text from this page using the [Tesseract](https://code.google.com/p/tesseract-ocr/) Optical Character Recognition program:  
  
$ tesseract ALIM0005.tif ALIM0005  
$ cat ALIM005.txt  
  
·=~·   
CONSTABLE, john, R.A.----ranlinued  
1838 May IS Foste1's john Constable, R.A. 54. Flatford Mill-Horse and Barge Leslie 52 IO O  
1838 May IS ,, john Constable, R.A. 55. View near Flatford Mill Rochard II 0 6  
1838 May I5 ,, john Constable, R.A. 56. Hampstead Heath Burton I7 6 6  
1838 May IS ,, john Constable, R.A. 57. Gillingham Mill Leslie 37 16 6  
1838 May I5 ,, john Constable, R.A. 58. East Bergholt Nursey 5 I5 6  
1838 May IS ,, john Constable, R.A. 59. Flatl`ord·-Barge Building Sheepshanlrs SI 9 O  
1838 May IS ,, john Constable, R.A. 60. Two Views near Pétworth Swaby 7 7 0  
1838 May IS ,. john Constable, R.A. 61. Hampstead Heath--London in distance Archbutt Jl IO 0  
1838 May I5 ,, john Constable, R.A. 65. Dedham Vale--Long Valley Norton 25 4 6  
1838 May IS ., john Constable, R.A. 66. London from Hampstead Burton 63 0 0  
1838 May I5 ,, john Constable, R.A. 67. Flatford Mill--Dark Allnutt 34 I3 0  
1838 May IS ,, john Constable, R.A. 68. Brighton and Chain Pier. Ex. 1827 Tiffin 45 3 0  
1838 May I5 ., john Constable, R.A. 69. The Lock near Flatford Mill Archbutt 44 2 0  
1838 May IS ,, john Constable, R.A. 70. The Glebe Farm. R.A. 1835 Miss Constable 74 ll 0  
1838 May IS ,, john Constable, R.A. 71. The Cenotaph, etc. R.A. 1836 Miss Constable 42 0 0  
1838 May IS ,, john Constable, R.A. 72. Salisbury Cathedral from Bishop's  
Garden. 1823 Tiflin 64 1 0  
1838 May I5 john Constable, R.A. 73. View in Helmingham Park. R./\. 1830 Allnutt 56 I4 0  
1838 May I5 john Constable, R./\. 74. Opening of \Vaterloo Bridge. R.A. 1832 Mosley 63 0 0  
1838 May IS john Constable, R.A. 75. View of Dedham--Gipsies. R.A. 1828 M. Bone 105 0 0  
1838 May IS john Constable, R.A. 76. The Lock. R.A. 1824. Sold at  
Foster's, February lslh, 1855, for {903 Birch 131 0 0  
1838 May I5 john Constable, R.A. 77. On the River Stour--Ho1se on a  
Barge. R.A. 1819 Morton 157 I0 0  
1838 May IS ,, john Constable, R.A. 78. Hadleigh Castle. R.A. 18:9 Miss Constable 105 0 °  
1838 May IS ,, john Constable, R.A. 79. Salisbury Cathedral from Meadows. 1831 Ellis 110 5 0  
1838 May IS ,, john Constable, R.A. 80. Dedham Mill and Church Brown 45 3 0  
1838 May IS ,, john Constable, R.A. 81. Arundel Castle and Mill. 1837 j. Constable 7S I5 0  
1839 April 13 Christie's Samuel Archbutt. 114. Salisbury Cathedral from Meadows Theobald 3l I0 0  
1839 April 13 ,, Samuel Archbutt. 115. Embarlcation of George IV, Waterloo  
Bridge Bought in 43 1 0  
1846 May 16 ,, Mr. 'I`aunton. 41. Salisbury Cathedral Bought in 441 0 0  
1846 May 16 ,, Mr. Taunton. 42. Dedham Bought in 357 0 0  
1846 june 4 ,, Edward Higginson. 77. Waggon passing through a River Rought 378 0 0  
1848 May 3 Phillips Ralph Thomas. 176. Salisbury Cathedral -- ---  
1848 june 2 Christie's Sir Thos. Baring. 21. Opening \Vaterloo Bridge Barton 33 2 0  
1849 May 27 ,, Taunton. 110. Salisbury Cathedral from the Meadows. The  
celebrated picture Rought 430 I0 0  
1849 May 27 ,, Taunton. ll 1. Dedham, with Towing Path Bought in 157 I0 0  
ISS! june 13 ,, Hogarth. 46. Hadleigh Castle Winter 320 5 0  
1853 Mar. 7 ,, R. Morris. 131. A Lock on the Stour Wass 105 0 0  
1853 july 7 ,, Charles Birch. 41. jumping Horse on the Stour Gambart 393 I5 0  
1853 .l'·'lY 7 1. Charles Birch. 42. Opening of London Bridge Bought in 252 0 0  
185; Feb. I5 F0ster's Charles Birch. 18. The Lock. 55 11 48 Holmes 860 0 0  
  


The data is quite noisy. It's possible to clean up a few pages by hand individually, but cleaning up an entire volume would be more practical with Internet-based collaboration. Project Gutenberg's Distributed Proofreaders project is a good example of this.  
  
Next time we'll clean up the data and load it into R.  


