# frozen_string_literal: true

require 'byebug'

# This module can deal with read and write json, and format datas for put at the json
module HandlerJson
  private

  def save_json(object, main_name, file_path)
    json = read_json(file_path)

    File.open(file_path, 'w') do |file|
      file.puts JSON.pretty_generate(json.merge(hashed_object(object, main_name, json)))
    end
  end

  def read_json(file_path)
    return {} unless File.exist?(file_path)

    begin
      JSON.parse(File.read(file_path))
    rescue StandardError
      {}
    end
  end

  def hashed_object(object, main_name, attributes = {})
    attributes[main_name] = {}
    object.instance_variables.each do |attribute|
      formated_attribute = attribute.to_s[1..]
      attributes[main_name][formated_attribute] = object.send(formated_attribute)
    end

    attributes
  end
end
