#!/usr/bin/env ruby

require_relative 'lib/month'

month = ARGV[0].to_i
year = ARGV[1].to_i

def exit_with_help_message
  print "Date not in acceptable format/range\n"
  exit
end

exit_with_help_message if ARGV.empty?
exit_with_help_message if year < 1800 or year > 3000
exit_with_help_message if month == '' or year == ''
exit_with_help_message if month > 12 or month < 1

m = Month.new(month, year)
puts m.to_s

