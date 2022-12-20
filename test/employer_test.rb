require 'minitest/autorun'

require_relative '../lib/employer'

class EmployerTest < MiniTest::Test
  def setup
    @employer = Employer.new({name: 'Joseph', age: 21})
  end

  def test_initialize
    assert_equal('Joseph', @employer.name)
    assert_equal(21, @employer.age)
    assert_nil @employer.start_time
    assert_nil @employer.end_time
  end

  def test_punched
    assert_equal(false, @employer.punched?)

    @employer.start_time = Time.now

    assert_equal(false, @employer.punched?)

    @employer.end_time = Time.now

    assert_equal(true, @employer.punched?)
  end
end