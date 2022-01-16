# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Tests classes
class TestClasses < Minitest::Test
  def test_measurement
    measurement = Measurement.new 50
    _measurements_asserts measurement
  end

  def _measurements_asserts(measurement)
    assert_instance_of Measurement, measurement
    assert_equal 50, measurement.value
    assert_equal 2, measurement.digits_count
    assert_output(/Measurement\(value=.*\)/) { measurement.log }
  end

  def test_described_measurement
    described_measurement = DescribedMeasurement.new 100, 'degrees'
    _described_measurements_asserts described_measurement
    _described_measurements_specific_asserts described_measurement
  end

  def _described_measurements_asserts(described_measurement)
    assert_instance_of DescribedMeasurement, described_measurement
    assert_equal 100, described_measurement.value
    assert_equal 3, described_measurement.digits_count
    assert_output(/DescribedMeasurement\(value=.*, description=".*"\)/) { described_measurement.log }
  end

  def _described_measurements_specific_asserts(described_measurement)
    assert_kind_of Measurement, described_measurement
    assert_equal 'degrees', described_measurement.description
    assert_equal 7, described_measurement.symbols_count
  end
end
