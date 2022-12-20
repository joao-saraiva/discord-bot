# frozen_string_literal: true

# This class represent the abstraction of an employer, in the way to archive the time
# that it start to work, and finish the work
class Employer
  attr_accessor :name, :age, :start_time, :end_time

  def initialize(options = {})
    @name = options[:name]
    @age = options[:age]
  end

  def punched?
    !@start_time.nil? && !@end_time.nil?
  end
end
