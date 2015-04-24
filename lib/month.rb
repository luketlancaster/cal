require_relative 'day'
require_relative 'year'

class Month
  attr_reader :month, :year, :name, :day_names, :start_day, :year, :banner

  def initialize(month, year)
    @month = month
    @year = year
    @day_names = 'Su Mo Tu We Th Fr Sa'
    @start_day = Day.new(month, year)
    @leap = Year.new(year)
  end

  def name
    month_array = ['Months', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    @name = month_array[@month]
  end

  def days_in_month
    if @month == 1 or @month == 3 or @month == 5 or @month == 7 or @month == 8 or @month == 10 or @month == 12
      31
    elsif @month == 2 and @leap.leap?
      29
    elsif @month == 2
      28
    else
      30
    end
  end

  def to_s
    @banner = (name << ' ' << year.to_s).center(20).rstrip
<<EOS
#{banner}
#{day_names}
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
  end

end
