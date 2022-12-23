require 'minitest/autorun'

require_relative '../lib/pendecy'
require_relative '../lib/employer'

class PendecyTest < MiniTest::Test
  def setup
    ENV['test'] = 'true'
    @pendecy = Pendecy.new({title: 'This is a title', description: 'This is a description'})
  end

  def test_initialize
    assert_equal(@pendecy.title, 'This is a title')
    assert_equal(@pendecy.description, 'This is a description')
  end

  def test_perfom
    author = Employer.new({name: 'Joseph'})

    assert_equal(@pendecy.perfom(author), true)
    assert_nil(@pendecy.perfom(nil), nil)
  end
end