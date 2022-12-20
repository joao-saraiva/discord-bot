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
    json = File.read(file_path)
    entire_json = begin
      JSON.parse(json)
    rescue StandardError
      {}
    end

    File.open(file_path, 'w') do |file|
      file.puts JSON.pretty_generate(entire_json.merge(hashed_employer(employer, entire_json)))
    end
  end

  private

  def file_path
    path = '/home/coreplan/Documents/Study/discord-bot/json'
    path += '/test' if ENV['test']

    path += "/#{Time.now.day}_#{Time.now.month}_#{Time.now.year}.json"

    path
  end

  def hashed_employer(employer, attributes = {})
    attributes[employer.name] = {}
    employer.instance_variables.each do |attribute|
      formated_attribute = attribute.to_s[1..]
      attributes[employer.name][formated_attribute] = employer.send(formated_attribute)
    end

    attributes
  end
end
