require_relative 'helper'
require_relative '../lib/year'

class TestYear < Minitest::Test

  def test_initializing_a_year_saves_values
    y = Year.new(2015)
    assert_equal 2015, y.year
  end

  def test_leap_returns_true_for_leap_year
    y = Year.new(2016)
    assert_equal true, y.leap?
  end

  def test_leap_returns_false_for_non_leap
    y = Year.new(1902)
    assert_equal false, y.leap?
  end

  def test_leap_returns_false_for_century
    y = Year.new(1900)
    assert_equal false, y.leap?
  end

  def test_leap_returns_true_for_century_mod_400
    y = Year.new(2400)
    assert_equal true, y.leap?
  end

  def test_create_year_of_12_months
    y = Year.new(2102)
    assert_equal 12, y.months_creator.length
  end

  def test_month_1_is_January
    y = Year.new(1800)
    assert_equal "January", y.months_creator[0].name
  end

  def test_month_6_is_June
    y = Year.new(1899)
    assert_equal "June", y.months_creator[5].name
  end

  def test_month_12_is_December
    y = Year.new(1899)
    assert_equal "December", y.months_creator[11].name
  end



end
