#!/usr/bin/env ruby

require_relative 'lib/month'
require_relative 'lib/year'

def exit_with_help_message
  print "Date not in acceptable format/range\n"
  exit
end

if ARGV.length == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i
elsif ARGV.length == 1
  year = ARGV[0].to_i
else
  exit_with_help_message
end

if ARGV.length == 2
  exit_with_help_message if year < 1800 or year > 3000
  exit_with_help_message if month == '' or year == ''
  exit_with_help_message if month > 12 or month < 1

  m = Month.new(month, year)
  puts m.to_s
elsif ARGV.length == 1
  exit_with_help_message if year < 1800 or year > 3000
  exit_with_help_message if year == ''

  y = Year.new(year)
  puts y.to_s
end
