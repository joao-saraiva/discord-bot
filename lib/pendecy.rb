# frozen_string_literal: true

require 'byebug'

require_relative 'handler_json'

# This class is able to generate a pendecy as json
class Pendecy
  include HandlerJson

  attr_accessor :author, :title, :description

  def initialize(options = {})
    @title = options[:title]
    @description = options[:description]
  end

  def perfom(author)
    return if author.nil?

    @author = author.name

    begin
      save_json(self, @title, file_path)

      true
    rescue StandardError
      false
    end
  end

  def file_path
    path = '/home/coreplan/Documents/Study/discord-bot/json'
    path += '/test' if ENV['test']

    path += "/pendecy_#{Time.now.day}_#{Time.now.month}_#{Time.now.year}.json"

    path
  end
end
