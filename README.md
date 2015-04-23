# cal
##Ruby implementation of Unix Cal
##Nashville Software School Cohort 8

###Objectives
* Practice with Arrays, Hashes, and Strings
* Develop the logic of a non-trivial algorithm
* Programming to meet a specification

###Requirements
* Unit tests and integration tests using MiniTest
* No built-in Ruby classes that provide date and time
* No shellig out to Kernel/Unix programs
* Code must be committed at least once per day
* No sharing of code with fellow students
* The program will accept any combination of months and years
  between 1800 and 300

###Implementation Order
1. Implement Zeller's Congruence
2. Implement printing a month where the first day is on a Sunday
3. Combine 1 and 2 for basic month printing
4. Print entire years using the above

###Usage for Month Printing
Run the program by running `ruby cal.rb` or `./cal.rb`

The first argument is the month. The second is the year.

The input of `./cal.rb 01 2012` outputs the following:

"    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31"

* The program only accepts dates in the MM YYYY format, using only
  numbers

* Print the month following the Unix cal style output

If there was no acceptable input the program outputs:

> Date not in acceptable format/range

### Test Cases

* Start with a month that starts on Sunday
* Regular leap years
* Century leap years
* 400 year leap years
* Test each month length
  * Two for Feburary
* Min date - Jan 1800
* Max date - Dec 3000
* Outlier dates on either side of min and max
* Include error cases
  * April 2014
  * 2014 04
  * etc
