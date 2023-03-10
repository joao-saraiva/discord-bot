# frozen_string_literal: true

# This class represent the abstraction of an employer, in the way to archive the time
# that it start to work, and finish the work
class Employer
  attr_accessor :name, :start_time, :end_time

  def initialize(options = {})
    @name = options[:name]
  end
end
