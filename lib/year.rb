require_relative 'month'

class Year
  attr_reader :year, :months, :one, :two, :three, :month_array

  def initialize(year)
    @year = year
    @months = []
    @one = []
    @two = []
    @three = []
    @month_array = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
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

  def months_creator
    12.times do |x|
      @months[x] = Month.new((x + 1), year).to_s_for_year
    end
    months.each_slice(3) do |a, b, c|
      @one << a
      @two << b
      @three << c
    end
  end

  def line_creator(col)
    group = ""
    counter = 0
    @one[col].each_line do |line|
      if counter == 0
        counter += 1
      else
        group << line.rstrip << '  ' << @two[col].lines[counter].rstrip << '  ' << three[col].lines[counter]
        counter += 1
      end
    end
    group
  end

  def to_s
    months_creator
    months1 = @month_array[0].center(20, ' ') << @month_array[1].center(24, ' ') << @month_array[2].center(20, ' ')
    months2 = @month_array[3].center(20, ' ') << @month_array[4].center(24, ' ') << @month_array[5].center(20, ' ')
    months3 = @month_array[6].center(20, ' ') << @month_array[7].center(24, ' ') << @month_array[8].center(20, ' ')
    months4 = @month_array[9].center(20, ' ') << @month_array[10].center(24, ' ') << @month_array[11].center(20, ' ')
    banner = (year.to_s).center(63).rstrip << "\n"
    row1 = line_creator(0)
    row2 = line_creator(1)
    row3 = line_creator(2)
    row4 = line_creator(3)

    <<EOS
#{banner}
#{months1}
#{row1}
#{months2}
#{row2}
#{months3}
#{row3}
#{months4}
#{row4}

EOS

  end

end
