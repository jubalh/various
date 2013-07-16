require 'rubygems'
require 'IRC'

server = 'irc.freenode.org'
port = 6667;
nick = 'brbi'
rl = 'nombrehombre'

bot = IRC.new(nick, server, port, rl)
IRCEvent.add_callback('endofmotd') { |event| bot.add_channel('##learnanylanguage') }
IRCEvent.add_callback('join') { |event|
	bot.send_message(event.channel, "Hello #{event.from}")
}
bot.connect
