require 'minitest/autorun'

require_relative '../lib/employer'
require_relative '../lib/punch_the_clock'

class PunchTheClockTest < MiniTest::Test
  def setup
    @punch_the_clock = PunchTheClock.new
  end

  def test_perfom_start_time
    employer = Employer.new({name: 'Joseph', age: 21})

    start_time = Time.now
    @punch_the_clock.perfom_start_time(start_time, employer)

    assert_equal(employer.start_time, start_time)
  end

  def test_perform_end_time
    employer = Employer.new({name: 'Joseph', age: 21})

    end_time = Time.now
    @punch_the_clock.perfom_end_time(end_time, employer)

    assert_equal(employer.end_time, end_time)
  end
end