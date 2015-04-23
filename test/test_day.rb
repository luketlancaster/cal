require_relative 'helper'
require_relative '../lib/day'

class TestDay < Minitest::Test

  def test_initializing_a_day_saves_values
    d = Day.new(05, 2015)
    assert_equal 05, d.month
    assert_equal 2015, d.year
  end

  def test_initializing_a_month_starting_on_sunday
    d = Day.new(01, 2012)
    assert_equal 1, d.day_of_week
  end

  def test_initializing_a_month_starting_on_tuesday
    d = Day.new(04, 2014)
    assert_equal 3, d.day_of_week
  end

  def test_initializing_a_month_starting_on_wednesday
    d = Day.new(10, 2014)
    assert_equal 4, d.day_of_week
  end

  def test_initializing_a_month_starting_on_friday
    d = Day.new(03, 2013)
    assert_equal 6, d.day_of_week
  end


end


