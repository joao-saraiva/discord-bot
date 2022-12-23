# frozen_string_literal: true

require 'discordrb'

PREFIXES = {
  345_687_437_722_386_433 => '!',
  83_281_822_225_530_880 => '?'
}.freeze

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

bot.run
