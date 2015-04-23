class Day
  attr_reader :month, :year, :day

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day_of_week
    if @month <= 2
      @year -= 1
      @month += 12
    end

    # Figuring the day the month starts on based on Zeller's Congruence:
    # http://en.wikipedia.org/wiki/Zeller%27s_congruence
    # q is the day of the month, which we will always assume is 1
    # m is the day of month. (3 = March, 4 = April, 5 = May, ..., 14 = February)
    # y is the year, -1 if the month is January or Feburary
    q = 1
    m = @month
    y = @year

    @day = (q + (((m + 1) * 26) / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7
    @day
  end
end
