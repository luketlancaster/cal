require_relative 'month'

class Year
  attr_reader :year, :months

  def initialize(year)
    @year = year
    @months = []
  end

  def months_creator
    12.times do |x|
      @months[x] = Month.new((x + 1), year)
    end
    @months
  end

  def leap?
    if year % 4 == 0 and year % 100 == 0 and year % 400 == 0
      return true
    elsif year % 4 == 0 and year % 100 == 0
      return false
    elsif year % 4 == 0
      return true
    else
      return false
    end
  end

end
