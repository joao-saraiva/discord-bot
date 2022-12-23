# frozen_string_literal: true

require 'discordrb'

PREFIXES = {
  345_687_437_722_386_433 => '!',
  83_281_822_225_530_880 => '?'
}.freeze

prefix_proc = proc do |message|
  prefix = PREFIXES[message.channel.id] || '.'
  message.content[prefix.size..] if message.content.start_with?(prefix)
end

bot = Discordrb::Commands::CommandBot.new(token: 'token', prefix: prefix_proc)

bot.command(:punch_the_clock, description: 'Punch your clock',
                              usage: 'Start or Finish your clock') do |event|
  punch_the_clock = PunchTheClock.new

  employer = Employer.new({ name: event.author })
  punch_the_clock.punch(Time.now, employer)
end

bot.run
