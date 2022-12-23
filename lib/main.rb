# frozen_string_literal: true

require 'discordrb'

PREFIXES = {
  345_687_437_722_386_433 => '!',
  83_281_822_225_530_880 => '?'
}.freeze

REQUIRED_INPUT_PENDECY = %w[title description].freeze

PUNCH_THE_CLOCK = PunchTheClock.new.freeze

prefix_proc = proc do |message|
  prefix = PREFIXES[message.channel.id] || '.'
  message.content[prefix.size..] if message.content.start_with?(prefix)
end

bot = Discordrb::Commands::CommandBot.new(token: 'token', prefix: prefix_proc)

bot.command(:punch_the_clock, description: 'Punch your clock',
                              usage: 'Start or Finish your clock') do |event|
  time = Time.now

  employer = Employer.new({ name: event.author })
  PUNCH_THE_CLOCK.punch(time, employer)

  if employer.start_time
    event.respond "You start your work at #{time}"
  else
    event.respond "You finish your work at #{time}"
  end
end

bot.command(:who_worked_at, description: 'Check who was present at the reunion',
                            usage: 'Check who was present at the reunion') do |event, input|
  path = "/home/coreplan/Documents/Study/discord-bot/json/punch_the_clock_#{input}"

  if File.exist?(path)
    event.respond PUNCH_THE_CLOCK.who_worked_at(input)
  else
    event.respond 'There is no register for this day'
  end
end

bot.command(:create_pendecy, description: 'Create a pendecy', usage: 'Create a pendecy') do |event, input|
  inputs = input.delete(' ').split(',').map { |formated_input| formated_input.split(':') }

  if (inputs.flatten & REQUIRED_INPUT_PENDECY).any?
    author = Employer.new({ name: event.author })
    title = inputs.select { |formated_input| formated_input.include?('title') }.flatten[1]
    description = inputs.select { |formated_input| formated_input.include?('description') }.flatten[1]

    Pendecy.new({ title: title, description: description }).perfom(author)
  else
    event.respond 'Invalid input, try to pass like this: title: My title, description: my description'
  end
end

bot.run
