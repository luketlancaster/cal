require_relative 'month'

class Year
  attr_reader :year, :months, :first_col, :second_col, :third_col

  def initialize(year)
    @year = year
    @months = []
    @first_col = []
    @second_col = []
    @third_col = []
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
      @first_col << a
      @second_col << b
      @third_col << c
    end
  end

  def line_creator(col)
    group = ""
    counter = 0
    @first_col[col].each_line do |line|
      if counter == 0
        group << line.center(10, ' ').chomp
        group << ' ' << @second_col[col].lines[counter].chomp.center(22, ' ')
        group << ' ' << @third_col[col].lines[counter].center(20, ' ').rstrip << "\n"
        counter += 1
      else
        group << line.rstrip.ljust(20, ' ')
        group << '  ' << @second_col[col].lines[counter].rstrip.ljust(20, ' ')
        group << '  ' << @third_col[col].lines[counter].ljust(20, ' ').rstrip << "\n"
        counter += 1
      end
    end
    group
  end

  def to_s
    months_creator
    banner = (year.to_s).center(63).rstrip << "\n"
    row1 = line_creator(0).chomp
    row2 = line_creator(1).chomp
    row3 = line_creator(2).chomp
    row4 = line_creator(3).chomp

    <<EOS
#{banner}
#{row1}
#{row2}
#{row3}
#{row4}
EOS

  end

end
