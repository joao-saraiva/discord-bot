require 'minitest/autorun'

require_relative '../lib/punch_the_clock_bot'

class PunchTheClockBotTest < MiniTest::Test
  def setup 
    @punch_the_clock_bot = PunchTheClockBot.new
  end
end