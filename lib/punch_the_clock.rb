#frozen_string_literal: true

# This class represent an absctracion on the action of punch the clock.
class PunchTheClock
  attr_accessor :punched_at, :puncher

  def initialize(options = {})
    self.puncher = options[:puncher]
    self.punched_at = options[:punched_at]
  end

  def punched?
    !@punched_at.nil?
  end
end