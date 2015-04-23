#!/usr/bin/env ruby

month = ARGV[0]
year = ARGV[1]
`cal #{month} #{year}`
