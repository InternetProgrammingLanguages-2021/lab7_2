# frozen_string_literal: true

# Class containing an integer
class Measurement
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def log
    puts "Measurement(value=#{@value})"
  end

  def digits_count
    @value.abs.to_s.length
  end
end

# Class containing an integer and a string
class DescribedMeasurement < Measurement
  attr_reader :description

  def initialize(value, description = '')
    super value
    @value ||= value
    @description = description
  end

  def log
    puts "DescribedMeasurement(value=#{@value}, description=\"#{@description}\")"
  end

  def symbols_count
    description.length
  end
end
