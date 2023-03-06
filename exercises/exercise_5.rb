require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
@total_revenue = Store.sum(:annual_revenue)
@number_of_stores = Store.count
puts "Total: #{@total_revenue}"
puts "Average: #{@total_revenue/@number_of_stores}"

@count_sotres_more_1m = Store.where('annual_revenue >= ?', 1000000).count
puts "Number of stores with more than 1m sales is #{@count_sotres_more_1m}"


