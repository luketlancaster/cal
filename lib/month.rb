require_relative 'day'

class Month
  attr_reader :month, :year, :name, :day_names

  def initialize(month, year)
    @month = month
    @year = year
    @day_names = 'Su Mo Tu We Th Fr Sa'
  end

  def name
    month_array = ['Months', 'January', 'February', ' March', ' April', '  May', ' June', ' July', 'August', 'September', 'October', 'November', 'December']
    @name = month_array[@month]
  end

  def to_s
    <<EOS
    #{name} #{year}
#{day_names}
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
  end

end
