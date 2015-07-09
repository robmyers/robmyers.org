---
author: robmyers
comments: true
date: 2011-02-10 20:19:06+00:00
layout: post
slug: exploring_art_data_17
title: Exploring Art Data 17
wordpress_id: 1921
categories:
- Art Computing
- Art History
- Art Open Data
---

Let's clean up the Constable data from Graves Art Sales.  
  
This extract shows most of the issues with the scanned and OCR-ed data:  
  


    
    1839 April 13 Christie's Samuel Archbutt. 114. Salisbury Cathedral from Meadows Theobald
    I839 April 13 Samuel Archbutt. 115. Embarltation of George IV, Waterloo
    Bridge Bought in 43 1 o
    1345 May 16 Mr. Taunton. 41. Salisbury Cathedral Bought in 441 o o
    1846 May 16 Mr. Taunton. 42. Dedham Bought in 357 o 0
    1345 June 4 ,, Edward Higginson. 77. Waggon passing through a River Rought 378 o o
    1848 May 3 Phillips Ralph Thomas. 176. Salisbury Cathedral - -
    I848 June 2 Christie's Sir Thos. Baring. 21. Opening Waterloo Bridge Barton 33 2 o
    1349 May 17 Taunton. 11o. Salisbury Cathedral from the Meadows. The
    celebrated picture Rought 43o 1o o
    1349 M87 I7 Taunton. 111. Dedham, with Towing Path Bought in 157 1o o
    1351 June 13 H03lrlh- 46. Hadleigh Castle Winter 32o 5 0
    1353 M111 1 R. Morris. 131. A Lock on the Stour Wass 105 o o


Some lines run on, some lines end with dashes or no numbers, some numbers are mistaken for letters, some words are corrupted. There are also blank lines between each scanned page of the book.  
  
First we can fix the run-on lines and blank lines in a text editor, deleting the newline to make them into single lines or combining run-ons.  
  
Then we can write a shell script to fix other issues. It's important to make sure that the script doesn't introduce more problems, so each substitution should be small, well-defined and carefully tested.  
  
Here's such a script (cleanup.sh):  
  


    
    #!/bin/sh
    INFILE=constable-ocr.txt
    OUTFILE=constable-processed.txt
    EDITFILE=constable.txt
    # Send the source file to sed
    cat "${INFILE}" | sed --regexp-extended '
    # Fix numbers, where o=0 and 1=1
    s/I([123456789]+)/1\1/g
    s/([123456789]+)I/\11/g
    s/([123456789]+)o/\10/g
    # Fix years, 15,13 = 18
    s/^1[35]/18/
    # Fix trailing zeroes mistaken for o
    s/ o o$/ 0 0/
    s/ o$/ 0/
    # Fix mistaken characters
    s/I-I/H/g
    s/,,/"/
    # Make sure john constable is properly OCR-ed
    s/(Iohn|john)/John/g
    s/(C0nstable|Oonstable)/Constable/g
    s/JohnCon.stable/John Constable/
    # Fix frequently mistaken words and acronyms
    s/ILA./R.A./
    # Fix spacing
    s/,R.A./, R.A./
    s/Constable R.A./Constable, R.A./
    ' > "${OUTFILE}"
    # Make a copy of the processed file ready to be edited by hand
    cp "${OUTFILE}" "${EDITFILE}"


In the shell script we use GNU sed, a command-line utility that allows us to use regular expressions to modify the contents of files. If you don't know regular expressions they can look quite mysterious, but in fact they are a simple and expressive language that greatly increase what you can do on a computer if you learn how to use them.  
  
Why on earth go to all this trouble just to change a few typos? Well, if we manage to improve the inital scanning or OCR, we don't have to fix any remaining problems by hand. The script may record techniques that are useful elsewhere. And it's more controllable to re-run a script rather than undo or search and replace mistakes made in a document editor.  
  
Once you've replaced the obvious patterns of typos, it's time to edit the text by hand. Compare each column of each line to the scan or to the original text, first all the dates, and auction houses, then all the names, then all the descriptions, then all the names and prices. When comparing numbers, check each digit as the year or the day of the month may be out by as little as one. Tesseract doesn't seem to capture double quotes very often in the scans I used, so I had to add these in by hand. It also doesn't capture em dashes, which I've represented as a hyphen to make parsing easier later.  
  
It only seems like processing each page will take forever for the first few pages. You'll quickly learn how to break down the task into manageable chunks.  
  
Here is an example of cleaned up data:  
  


    
    1834 June 7 Christie's - 67. Landscape with Figures - -
    1838 May 15 Foster's John Constable, R.A. 3. Stonehenge, etc. Smith 4 14 6
    1838 May 15 " John Constable, R.A. 10. Glebe Farm, etc. Williams 3 15 0
    1838 May 15 " John Constable, R.A. 12. Salisbury Cathedral and Helmingham Park Allnutt 3 9 0
    1838 May 15 " John Constable, R.A. 13. Salisbury Cathedral and Glebe Farm Carpenter 24 10 6
    1838 May 15 " John Constable, R.A. 14. Comlield. Study for N.G. picture Radford 9 19 6
    1838 May 15 " John Constable, R.A. 23. Salisbury Cathedral, etc. Leslie 11 11 0
    1838 May 15 " John Constable, R.A. 26. Dedham Rulton 8 8 0
    1838 May 15 " John Constable, R.A. 29. View in Helmingham Park Swaby 16 5 6
    1838 May 15 " John Constable, R.A. 30. Salisbury Cathedral from Bishop's Garden Archbutt 16 16 0
    1838 May 15 " John Constable, R.A. 31. Hadleigh Castle. Sketch Smith 3 13 6
    1838 May 15 " John Constable, R.A. 33. Two Views of East Bergholt Archbutt 24 3 0
    1838 May 15 " John Constable, R.A. 35. River Scene and Horse Jumping Archbutt 52 10 0
    1838 May 15 " John Constable, R.A. 37. Salisbury Cathedral from Meadows Williams 6 10 0
    1838 May 15 " John Constable, R.A. 39. Mill on the Stour. Sketch Hilditch 7 17 6
    1838 May 15 " John Constable, R.A. 40. Opening Waterloo Bridge. Sketch Joy 2 10 0
    1838 May 15 " John Constable, R.A. 41. Weymouth Bay. Sketch. Swaby 4 4 0
    1838 May 15 " John Constable, R.A. 42. Waterloo Bridge and Brighton Archbutt 5 0 0
    1838 May 15 " John Constable, R.A. 43. Chain Pier and Dedham Church Stuart 5 5 0
    1838 May 15 " John Constable, R.A. 44. Hampstead Heath and Waterloo Bridge Morton 4 14 0
    1838 May 15 " John Constable, R.A. 45. Weymouth Bay, Waterloo Bridge, and two others Burton 7 7 0
    1838 May 15 " John Constable, R.A. 46. East Bergholt, Dedham, etc. Nursey 4 14 6
    1838 May 15 " John Constable, R.A. 47. Weymouth Bay and four others Williams 1 13 0
    1838 May 15 " John Constable, R.A. 48. Moonlight and Landscape with Rainbow Leslie 5 5 0
    1838 May 15 " John Constable, R.A. 49. Three Landscapes Archbutt 31 10 0
    1838 May 15 " John Constable, R.A. 50. Salisbury Madows Sheepshanks 35 14 0
    1838 May 15 " John Constable, R.A. 51. Study of Trees and Fern with Donkies Sheepshanks 23 2 0
    1838 May 15 " John Constable, R.A. 52. Cottage in a Cornfield Burton 27 6 0
    1838 May 15 " John Constable, R.A. 53. Hampstead Hath-at the Ponds Sheepshanks 37 5 6


It's possible to use scripts to check that the cleaned up data makes sense. We can check the dates are sequential, for example (check_dates.py):  
  


    
    #!/usr/bin/python
    # Usage: check_dates.py FILENAME
    # Assumes file with each line starting in Graves date format: YYYY month (D)D
    # Ensure that dates are sequential
    # Won't catch minor errors, will catch major errors
    import datetime
    import sys
    MONTHS={'jan':1, 'feb':2, 'mar':3, 'apr':4, 'may':5, 'jun':6, 'jul':7, 'aug':8,
    'sep':9, 'oct':10, 'nov':11, 'dec':12}
    def main():
    if len(sys.argv) != 2:
    print "Usage: %s FILENAME" % sys.argv[0]
    sys.exit(1)
    last_date=datetime.date(1779, 1, 1)
    for line in open(sys.argv[1]):
    components = line.split()
    year = int(components[0])
    month = MONTHS[components[1][:3].lower()]
    day = int(components[2])
    try:
    line_date = datetime.date(year, month, day)
    if line_date < last_date:
    print "Date not successive: %s" % line
    last_date = line_date
    except ValueError, e:
    print "Bad date component: %s" % line
    if __name__ == "__main__":
    main()
    


Once we have cleaned up the text, we can convert it to a machine readable format using another script. Actually writing such a script is an interactive process. Read the text, write a script that should be able to extract information from it, run the script, and then correct either the text (if the script fails to run because of typos in the text) or the script (if the script fails to extract all the information from the text). Here's the script for the Constable data (lines_to_tsv.py):  
  


    
    #!/usr/bin/python
    import re
    import sys
    ################################################################################
    # Assemble the regular expression to process each line
    ################################################################################
    # Date of sale
    # YYYY MONTH(.) D(D)
    DATE = r'(.{4} \w+.? \d{1,2})'
    # Auction house
    # " or name. Names are arbitrary, so use a list of names
    AUCTIONEER_LIST = ["B. Moulton", "Christie's", "Foster's", "Morrison & Co.",
    "Paris", "Phillips", "Robinson & F.", ]
    AUCTIONEER = ' ("|%s)' % '|'.join(AUCTIONEER_LIST)
    # Owner of work
    # Selling owner follows auction house and is followed by lot number
    # It may be absent, in which case it is a hyphen
    # Otherwise it's arbitrary but contains no numbers
    # This is weak, we rely on the strength of the auctioneer & lot groups to fix it
    OWNER = r' (-|\D+)'
    # Lot number
    # Possibly something in brackets, then one or more digits, with an optional
    # single letter or punctuation character, then a full stop
    LOT = r' (\([^)]+\) \d+.?\.|\d+.?\.)'
    # Description
    # Again this is arbitrary, so we rely on the strength of the adjacent groups
    DESCRIPTION = r' (.+?)'
    # Buyer
    # This is complex because Description is arbitrary
    # Buyer may be -, surname, initials, title and surname, and many others
    BUYER_TITLES = [r'Captain .+', r'Col\. .+', r"D'\w+", r'De .+', r'Dr\. .+', r'Earl .+', r'La .+', r'Lord .+', r'Major .+',
    # Miss .+ fails???
    r'Miss \w+', r'Mr\. .+', r'Sir .+',]
    BUYER_INSITITUTIONS = [r'Fine Art Society', r'National.+Gallery', r'New York',
    r'New York Museum',]
    BUYER_INITIALS = [r'[A-Z]\. [A-Z.]', ]
    BUYER_INDIRECT = [r'\(.+\)',]
    BUYER_SPECIAL = [r'Bought in', r'-',]
    BUYER_NAME = [r'[A-Z]\. \w+', r'[A-Z]\. [A-Z]\. \w+', r'\w+',]
    BUYER = r' (%s)?' % r'|'.join(BUYER_TITLES + BUYER_INSITITUTIONS + \
    BUYER_INITIALS + BUYER_INDIRECT + \
    BUYER_SPECIAL + BUYER_NAME)
    # Sale price
    # This may be absent entirely to indicate a group purchase, in which case we
    # cannot check for a leading space, so make both the leading space and the
    # other choices optional to handle that case
    # It may be a hyphen to indicate absent data
    # It may be pounds, shillings and pence, including zeros
    # Or it may be Withdrawn
    # Or it may be a quantity of French francs
    PRICE = r' ?(\d+ francs|\d+ \d+ \d+|Withdrawn|-)?'
    # The assembled regex for a line
    LINE = r'^'+ DATE + AUCTIONEER + OWNER + LOT + DESCRIPTION + BUYER + PRICE +r'$'
    LINE_REGEX = re.compile(LINE)
    ################################################################################
    # Convert lines to tab separated values
    ################################################################################
    # The column containing the auctioneer value
    AUCTIONEER_COLUMN = 1
    def process(infile):
    """Convert the line to tab-delimited fields"""
    # Lines that fail to match
    fails = []
    auctioneer = ""
    for line in infile:
    matches = LINE_REGEX.match(line)
    try:
    # Convert the tuple to a list in case we need to assign to it
    columns = list(matches.groups())
    # Get or cache the auctioneer, so we replace " with the actual one
    if columns[AUCTIONEER_COLUMN] != '"':
    auctioneer = columns[AUCTIONEER_COLUMN]
    else:
    columns[AUCTIONEER_COLUMN] = auctioneer
    print '\t'.join(columns)
    except Exception, e:
    print e
    fails.append("FAIL: %s" % line)
    return fails
    def print_header():
    """Print the column headers"""
    print "date\tauctioneer\towner\tlot\tdescription\tbuyer\tprice"
    ################################################################################
    # Main flow of execution
    ################################################################################
    def main():
    if len(sys.argv) != 2:
    print "Usage: %s FILENAME" % sys.argv[0]
    sys.exit(1)
    infile = open(sys.argv[1])
    print_header()
    fails = process(infile)
    sys.stderr.write(''.join(fails))
    if __name__ == "__main__":
    main()
    


And here's some of the output in tab separated value format, complete with header:  
  


    
    date	auctioneer	owner	lot	description	buyer	price
    1834 June 7	Christie's	-	67.	Landscape with Figures	-	-
    1838 May 15	Foster's	John Constable, R.A.	3.	Stonehenge, etc.	Smith	4 14 6
    1838 May 15	Foster's	John Constable, R.A.	10.	Glebe Farm, etc.	Williams	3 15 0
    1838 May 15	Foster's	John Constable, R.A.	12.	Salisbury Cathedral and Helmingham Park	Allnutt	3 9 0
    1838 May 15	Foster's	John Constable, R.A.	13.	Salisbury Cathedral and Glebe Farm	Carpenter	24 10 6
    1838 May 15	Foster's	John Constable, R.A.	14.	Comlield. Study for N.G. picture	Radford	9 19 6
    1838 May 15	Foster's	John Constable, R.A.	23.	Salisbury Cathedral, etc.	Leslie	11 11 0
    1838 May 15	Foster's	John Constable, R.A.	26.	Dedham	Rulton	8 8 0
    1838 May 15	Foster's	John Constable, R.A.	29.	View in Helmingham Park	Swaby	16 5 6
    1838 May 15	Foster's	John Constable, R.A.	30.	Salisbury Cathedral from Bishop's Garden	Archbutt	16 16 0
    1838 May 15	Foster's	John Constable, R.A.	31.	Hadleigh Castle. Sketch	Smith	3 13 6
    1838 May 15	Foster's	John Constable, R.A.	33.	Two Views of East Bergholt	Archbutt	24 3 0
    1838 May 15	Foster's	John Constable, R.A.	35.	River Scene and Horse Jumping	Archbutt	52 10 0
    1838 May 15	Foster's	John Constable, R.A.	37.	Salisbury Cathedral from Meadows	Williams	6 10 0
    1838 May 15	Foster's	John Constable, R.A.	39.	Mill on the Stour. Sketch	Hilditch	7 17 6
    1838 May 15	Foster's	John Constable, R.A.	40.	Opening Waterloo Bridge. Sketch	Joy	2 10 0
    1838 May 15	Foster's	John Constable, R.A.	41.	Weymouth Bay. Sketch.	Swaby	4 4 0
    1838 May 15	Foster's	John Constable, R.A.	42.	Waterloo Bridge and Brighton	Archbutt	5 0 0
    1838 May 15	Foster's	John Constable, R.A.	43.	Chain Pier and Dedham Church	Stuart	5 5 0
    1838 May 15	Foster's	John Constable, R.A.	44.	Hampstead Heath and Waterloo Bridge	Morton	4 14 0
    1838 May 15	Foster's	John Constable, R.A.	45.	Weymouth Bay, Waterloo Bridge, and two others	Burton	7 7 0
    1838 May 15	Foster's	John Constable, R.A.	46.	East Bergholt, Dedham, etc.	Nursey	4 14 6
    1838 May 15	Foster's	John Constable, R.A.	47.	Weymouth Bay and four others	Williams	1 13 0
    1838 May 15	Foster's	John Constable, R.A.	48.	Moonlight and Landscape with Rainbow	Leslie	5 5 0
    1838 May 15	Foster's	John Constable, R.A.	49.	Three Landscapes	Archbutt	31 10 0
    1838 May 15	Foster's	John Constable, R.A.	50.	Salisbury Madows	Sheepshanks	35 14 0
    1838 May 15	Foster's	John Constable, R.A.	51.	Study of Trees and Fern with Donkies	Sheepshanks	23 2 0
    1838 May 15	Foster's	John Constable, R.A.	52.	Cottage in a Cornfield	Burton	27 6 0
    1838 May 15	Foster's	John Constable, R.A.	53.	Hampstead Hath-at the Ponds	Sheepshanks	37 5 6


We use tabs rather than commas as the separator because the values include commas. Alternatively we could wrap each value in speech marks and comma separate them.  
  
Next we can load the data into R and examine it.

