require_relative 'day'
require_relative 'year'

class Month
  attr_reader :month, :year, :name, :day_names, :start_day, :year, :banner, :weeks

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
    if @month == 4 or @month == 6 or @month == 9 or @month == 11
      30
    elsif @month == 2 and @leap.leap?
      29
    elsif @month == 2
      28
    else
      31
    end
  end

  def month_creator
    @weeks = ''
    days_in_month.to_i.times do |day|
      if day < 9
        day += 1
        if day % 7 != 0
          @weeks << ' ' << day.to_s << ' '
        elsif day % 7 == 0
          @weeks << ' ' << day.to_s << "\n"
        end
      else
        day += 1
        if day % 7 != 0
          @weeks << day.to_s << ' '
        elsif day % 7 == 0
          @weeks << day.to_s << "\n"
        end
      end
    end
    @weeks = @weeks.to_s.rstrip
  end

  def to_s
    @weeks = month_creator
    @banner = (name << ' ' << year.to_s).center(20).rstrip
<<EOS
#{banner}
#{day_names}
#{weeks}

EOS
  end

end
