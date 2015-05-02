require_relative 'month'

class Year
  attr_reader :year, :months, :first_col, :second_col, :third_col, :group

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

  def to_s
    banner = (year.to_s).center(63).rstrip << "\n"

    <<EOS
#{banner}
#{create_year_string}
EOS
  end

  private

  def months_creator
    12.times do |x|
      @months[x] = Month.new((x + 1), year).to_s
    end
    months.each_slice(3) do |first_slice, second_slice, third_slice|
      @first_col << first_slice
      @second_col << second_slice
      @third_col << third_slice
    end
  end

  def create_month_rows(row)
    group = ""
    counter = 0
    @first_col[row].each_line do |line|
      if counter == 0
        line = line.gsub(/\d/, '').strip
        group << line.center(20).chomp
        group << ' ' + @second_col[row].lines[counter].gsub!(/\d/, '').strip.center(22)
        group << ' ' + @third_col[row].lines[counter].gsub!(/\d/, '').strip.center(20).rstrip + "\n"
        counter += 1
      else
        group << line.rstrip.ljust(20)
        if @second_col[row].lines[counter].nil?
          group << "\n".rstrip
        else
          group << '  ' + @second_col[row].lines[counter].rstrip.ljust(20)
        end
        if @third_col[row].lines[counter].nil?
          group << "\n"
        else
          group << '  ' + @third_col[row].lines[counter].ljust(20).rstrip + "\n"
        end
        counter += 1
      end
    end
    group
  end

  def create_year_string
    months_creator
    year = ''
    4.times do |col|
      year << create_month_rows(col)
    end
    year.chomp!
  end

end
