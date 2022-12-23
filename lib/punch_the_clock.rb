# frozen_string_literal: true

require 'json'

require_relative 'handler_json'

# This class represent an absctracion on the action of punch the clock.
class PunchTheClock
  include HandlerJson

  def punch(time, employer)
    json = read_json(file_path)

    json[employer.name] ? perfom_end_time(time, employer) : perfom_start_time(time, employer)
  end

  def perfom_start_time(start_time, employer)
    employer.start_time = start_time
    save_day_perfom(employer)
  end

  def perfom_end_time(end_time, employer)
    employer.end_time = end_time
    save_day_perfom(employer)
  end

  def save_day_perfom(employer)
    save_json(employer, employer.name, file_path)
  end

  def file_path
    path = '/home/coreplan/Documents/Study/discord-bot/json'
    path += '/test' if ENV['test']

    path += "/punch_the_clock_#{Time.now.day}_#{Time.now.month}_#{Time.now.year}.json"

    path
  end

  def who_worked_at(file)
    read_json(file).keys.join(', ')
  end
end
