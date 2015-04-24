require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_no_input
    output = `./cal.rb`
    expected = 'Date not in acceptable format/range'

    assert_equal expected, output
  end

  def test_date_too_early
    output = `./cal.rb 12 1799`
    expected = 'Date not in acceptable format/range'

    assert_equal expected, output
  end

  def test_wrong_format_named_month
    output = `./cal.rb April 2764`
    expected = 'Date not in acceptable format/range'

    assert_equal expected, output
  end

  def test_wrong_format_swapped_year_month
    output = `./cal.rb 1864 05`
    expected = 'Date not in acceptable format/range'

    assert_equal expected, output
  end

  def test_date_too_late
    output = `./cal.rb 1 3001`
    expected = 'Date not in acceptable format/range'

    assert_equal expected, output
  end

  def test_date_incorrect_length_of_year
    output = `./cal.rb 132 20014`
    expected = 'Date not in acceptable format/range'

    assert_equal expected, output
  end

  def test_valid_month_year_input_leading_0
    output = `./cal.rb 01 2012`
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

    assert_equal expected, output
  end

  def test_valid_month_year_input_no_leading_0
    output = `./cal.rb 1 2012`
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

    assert_equal expected, output
  end


  def test_min_acceptable_date
    output = `./cal.rb 01 1800`
    expected = <<EOS
    January 1800
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS

  assert_equal expected, output
  end

  def test_max_acceptable_date
    output = `./cal.rb 12 3000`
    expected = <<EOS
   December 3000
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS

  assert_equal expected, output
  end

  def test_jan_length
    output = `./cal.rb 01 1998`
    expected = <<EOS
    January 1998
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS

    assert_equal expected, output
  end

  def test_feb_non_leap_length
    output = `./cal.rb 02 1997`
    expected = <<EOS
   February 1997
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS

    assert_equal expected, output
  end

  def test_feb_leap_length
    output = `./cal.rb 02 2000`
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS

    assert_equal expected, output
  end

  def test_march_length
    output = `./cal.rb 03 1987`
    expected = <<EOS
     March 1987
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

    assert_equal expected, output
  end

  def test_april_length
    output = `./cal.rb 04 1870`
    expected = <<EOS
     April 1870
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30

EOS

    assert_equal expected, output
  end

  def test_may_length
    output = `./cal.rb 05 1892`
    expected = <<EOS
      May 1892
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

  assert_equal expected, output
  end

  def test_june_length
    output = `./cal.rb 06 1808`
    expected = <<EOS
     June 1808
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30

EOS

  assert_equal expected, output
  end

  def test_july_length
    output = `./cal.rb 07 1872`
    expected = <<EOS
     July 1872
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS

  assert_equal expected, output
  end

  def test_august_length
    output = `./cal.rb 08 1802`
    expected = <<EOS
    August 1802
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

    assert_equal expected, output
  end

  def test_september_length
    output = `./cal.rb 09 1964`
    expected = <<EOS
   September 1964
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

EOS

    assert_equal expected, output
  end

  def test_october_length
    output = `./cal.rb 10 1905`
    expected = <<EOS
    October 1905
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

    assert_equal expected, output
  end

  def test_november_length
    output = `./cal.rb 11 1934`
    expected = <<EOS
   November 1934
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30

EOS

  assert_equal expected, output
  end

  def test_december_length
    output = `./cal.rb 12 2999`
    expected = <<EOS
   December 2999
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS

    assert_equal expected, output
  end

  def test_six_week_month
    output = `./cal.rb 08 1800`
    expected = <<EOS
    August 1800
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31

EOS

    assert_equal expected, output
  end

  def test_skip_century_leap_year
    output = `./cal.rb 02 2200`
    expected = <<EOS
   February 2200
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS

    assert_equal expected, output
  end

  def test_every_400_leap_year
    output = `./cal.rb 02 2000`
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS

    assert_equal expected, output
  end
end





#* Start with a month that starts on Sunday
#* Regular leap years
#* Century leap years
#* 400 year leap years
#* Test each month length
