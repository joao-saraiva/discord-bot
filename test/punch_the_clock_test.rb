require 'minitest/autorun'

require_relative '../lib/punch_the_clock'

class PunchTheClockTest < MiniTest::Test
  def setup
    @punch_the_clock = PunchTheClock.new
  end

  def test_initialize
    assert_equal(false, @punch_the_clock.punched?)
    assert_equal(nil, @punch_the_clock.punched_at)
    assert_equal(nil, @punch_the_clock.puncher)
  end

  def test_punched
    assert_equal(false, @punch_the_clock.punched?)

    @punch_the_clock.punched_at = Time.now

    assert_equal(true, @punch_the_clock.punched?)
  end
end