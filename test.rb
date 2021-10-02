# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Tests classes
class TestClasses < Minitest::Test
  def setup
    super
    @measurement = Measurement.new 50
    @described_measurement = DescribedMeasurement.new 100, 'degrees'
  end

  def test_measurement
    assert_instance_of Measurement, @measurement
    assert_equal 50, @measurement.value
    assert_equal 2, @measurement.digits_count
    assert_output(/Measurement\(value=.*\)/) { @measurement.log }
  end

  def test_described_measurement
    assert_instance_of DescribedMeasurement, @described_measurement
    assert_kind_of Measurement, @described_measurement
    assert_equal 100, @described_measurement.value
    assert_equal 3, @described_measurement.digits_count
    assert_output(/DescribedMeasurement\(value=.*, description=".*"\)/) { @described_measurement.log }
    assert_equal 'degrees', @described_measurement.description
    assert_equal 7, @described_measurement.symbols_count
  end
end
