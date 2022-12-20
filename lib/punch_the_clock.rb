# frozen_string_literal: true

# This class represent an absctracion on the action of punch the clock.
class PunchTheClock
  def perfom_start_time(start_time, employer)
    employer.start_time = start_time
  end

  def perfom_end_time(end_time, employer)
    employer.end_time = end_time
  end
end
