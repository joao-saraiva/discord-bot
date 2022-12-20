require 'minitest/autorun'

require_relative '../lib/employer'

class EmployerTest < MiniTest::Test
  def setup
    @employer = Employer.new({name: 'Joseph', age: 21})
  end

  def test_initialize
    assert_equal 'Joseph', @employer.name
    assert_equal 21, @employer.age
    assert_nil @employer.start_time
    assert_nil @employer.end_time
  end
end