# frozen_string_literal: true

require 'json'

# This class represent an absctracion on the action of punch the clock.
class PunchTheClock
  def perfom_start_time(start_time, employer)
    employer.start_time = start_time
  end

  def perfom_end_time(end_time, employer)
    employer.end_time = end_time
  end

  def save_day_perfom(employer)
    File.open(file_path, "w") do |file|
      file.write(hashed_object.to_json)
    end
  end
end
