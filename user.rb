# frozen_string_literal: true

require './main'

puts 'Here you can type in some information to pass into objects'
puts 'Please enter the value of the measurement'
value = gets.to_i
puts 'Do you want to describe it? (y/n)'
is_described = (gets =~ /y/)
measurement = if is_described
                puts 'Please enter your description'
                description = gets.strip
                DescribedMeasurement.new(value, description)
              else
                Measurement.new(value)
              end
measurement.log
puts "Digits in value: #{measurement.digits_count}"
