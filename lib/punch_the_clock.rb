# frozen_string_literal: true

require 'json'

require_relative 'handler_json'

# This class represent an absctracion on the action of punch the clock.
class PunchTheClock
  include HandlerJson

  def perfom_start_time(start_time, employer)
    employer.start_time = start_time
  end

  def perfom_end_time(end_time, employer)
    employer.end_time = end_time
  end

  def save_day_perfom(employer)
    save_json(employer, employer.name, file_path)
  end

  def file_path
    path = '/home/coreplan/Documents/Study/discord-bot/json'
    path += '/test' if ENV['test']

    path += "/#{Time.now.day}_#{Time.now.month}_#{Time.now.year}.json"

    path
  end
end
