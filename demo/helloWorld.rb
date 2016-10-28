# The ubiquitous Hello World!


require "java"

stringHello= "Hello World"
stringDate = java.util.Date.new

puts "#{stringHello.to_s}"
puts "Date := #{stringDate.to_s}"
