# frozen_string_literal: true

# Class containing an integer
class Measurement
  attr_accessor :value

  # @param value [Integer]
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
  attr_accessor :description

  # @param value [Integer]
  # @param description [String]
  def initialize(value, description = '')
    super value
    @description = description
  end

  def log
    puts "DescribedMeasurement(value=#{@value}, description=\"#{@description}\")"
  end

  def symbols_count
    description.length
  end
end
