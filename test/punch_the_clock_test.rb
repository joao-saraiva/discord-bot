require 'minitest/autorun'

require_relative '../lib/employer'
require_relative '../lib/punch_the_clock'

class PunchTheClockTest < MiniTest::Test
  def setup
    ENV["test"] = "true"
    @punch_the_clock = PunchTheClock.new
  end

  def test_perfom_start_time
    employer = Employer.new({name: 'Joseph'})

    start_time = Time.now
    @punch_the_clock.perfom_start_time(start_time, employer)

    assert_equal(employer.start_time, start_time)
  end

  def test_perform_end_time
    employer = Employer.new({name: 'Joseph'})

    end_time = Time.now
    @punch_the_clock.perfom_end_time(end_time, employer)

    assert_equal(employer.end_time, end_time)
  end

  def test_save_day_perfom
    employer = Employer.new({name: 'Joseph'})
    @punch_the_clock.save_day_perfom(employer)

    employer2 = Employer.new({name: 'Chris'})
    @punch_the_clock.save_day_perfom(employer2)

    assert_equal true, File.exists?(@punch_the_clock.file_path)
  end
end