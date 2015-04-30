class Day
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day_of_week

    # Figuring the day the month starts on based on Zeller's Congruence:
    # http://en.wikipedia.org/wiki/Zeller%27s_congruence
    # q is the day of the month, which we will always assume is 1
    # m is the day of month. (3 = March, 4 = April, 5 = May, ..., 14 = February)
    # y is the year, -1 if the month is January or Feburary


    if @month <= 2
      @year -= 1
      @month += 12
    end

    q = 1
    m = @month
    y = @year

    day = (q + (((m + 1) * 26) / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7

    if day == 0
      day = 7
    end

    day
  end
end
