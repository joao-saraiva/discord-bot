require 'minitest/autorun'

require_relative '../lib/employer'

class EmployerTest < MiniTest::Test
  def setup
    @employer = Employer.new({name: 'Joseph'})
  end

  def test_initialize
    assert_equal('Joseph', @employer.name)
    assert_nil @employer.start_time
    assert_nil @employer.end_time
  end
end