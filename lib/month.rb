require_relative 'day'
require_relative 'year'

class Month
  attr_reader :month, :year, :name, :start_day
  attr_accessor :weeks

  def initialize(month, year)
    @month = month
    @year = year
    @start_day = Day.new(month, year).day_of_week
    @leap = Year.new(year).leap?
  end

  def name
    month_index = @month - 1
    month_array = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    @name = month_array[month_index]
  end

  def days_in_month
    if [4, 6, 9, 11].include?(@month)
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
    if @start_day.zero?
      6
    elsif @start_day == 1
      0
    else
      @start_day -= 1
    end
  end

  def create_array_of_days
    @weeks = []
    (1..days_in_month).each do |day|
      @weeks << day
    end
    @weeks
  end

  def shove_spaces_into_array_of_days
    create_array_of_days
    @weeks = @weeks.map do |day|
      if day < 10
        ' ' << day.to_s << ' '
      else
        day.to_s << ' '
      end
    end
    start_spaces.times { weeks.unshift('   ') }
  end

  def month_slicer
    shove_spaces_into_array_of_days
    month = ''
    @weeks.each_slice(7) {|week| month << week.join.rstrip << "\n"}
    month
  end

  def to_s
    <<EOS
#{(name << ' ' << year.to_s).center(20).rstrip}
Su Mo Tu We Th Fr Sa
#{month_slicer}
EOS
  end

  def to_s_for_year_class

    <<EOS
#{(name).center(20)}
Su Mo Tu We Th Fr Sa
#{month_slicer}
EOS
  end


end
