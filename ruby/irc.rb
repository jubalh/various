require 'socket'


con = TCPSocket.new("irc.freenode.net", 6667)
con.puts( "USER brbi brbi brbi bribi" )
con.puts( "NICK brbi" )
con.puts( "JOIN ##learnanylanguage" )

while data = con.readpartial(100) do
	puts data
end

con.close
