require_relative 'day'
require_relative 'year'

class Month
  attr_reader :month, :year, :name, :day_names, :start_day, :year, :banner, :days
  attr_accessor :weeks

  def initialize(month, year)
    @month = month
    @year = year
    @day_names = 'Su Mo Tu We Th Fr Sa'
    @start_day = Day.new(month, year)
    @leap = Year.new(year).leap?
  end

  def name
    month_index = @month - 1
    month_array = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    @name = month_array[month_index]
  end

  def days_in_month
    if @month == 4 or @month == 6 or @month == 9 or @month == 11
      30
    elsif @month == 2 and @leap
      29
    elsif @month == 2
      28
    else
      31
    end
  end

  def start_spaces
    day = @start_day.day_of_week
    if day.zero?
      6
    elsif day == 1
      0
    else
      day -= 1
    end
  end

  def month_creator
    @weeks = @weeks.map do |day|
      if day < 10
        ' ' << day.to_s << ' '
      else
        day.to_s << ' '
      end
    end

    start_spaces.times { weeks.unshift('   ') }

  end

  def week_creator
    @weeks = []
    days = days_in_month + 1
    days.times do |day|
      if day != 0
        @weeks << day
      end
    end
    weeks
  end

  def month_slicer
    week_creator
    month_creator
    month = ''
    @weeks.each_slice(7) {|week| month << week.join.rstrip << "\n"}
    month
  end

  def to_s
    @banner = (name << ' ' << year.to_s).center(20).rstrip
    <<EOS
#{banner}
#{day_names}
#{month_slicer}
EOS
  end

  def to_s_for_year
    @banner = (name).center(20)
    <<EOS
#{banner}
#{day_names}
#{month_slicer}
EOS
  end


end
