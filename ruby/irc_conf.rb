#in conf_classes.rb
class Server
  attr_accessor :adress :port

  def initialize ( adress, port=6667, chans )
    @adress = adress
    @port = port
  end

end

class UserInfo
  attr_accessor :real_name :user_name :nickname :alternative_nickname

  def initialize ( real_name user_name nickname alternative_nickname )
    @real_name = real_name
    @user_name = user_name
    @nickname = nickname
    @alternative_nickname = alternative_nickname
  end
end

class Connection
  attr_accessor :server_info :channels :user_info

  def initialize ( server, channels, user_info )
    @server = server
    @channels = channels
    @user_info = user_info
  end
end

#in conf.rb
require 'conf_classes.rb'

  chans = ['#a', '#b']
  server = Server.new 'irc.server.org' 6667
  user = UserInfo.new 'mein name' 'nutzername' 'cryza_nick' 'alternative'
  con1 = Connection.new( server, chans, user )

#spielen
#ausserdem erzeugen attr_accessor getter und setter, und da ich es sowieso als configuration haben wollte haette ich die sowieso alles im konstruktr uebergeben, also dochnur @varibalen. und das mit den hashes und arrays scheint mehr der ruby way zu sein. das mit den klassen ist sehr java haft. hat mich doch dauernd was dran gestoert :)
#nach einigem gruebeln kam ich dann drauf. YEAH
server_info = { :server => 'irc.freenode.net', :port => 6668 }
user_info = { :real_name => 'myname', :username => 'user', :nickname => 'cryza_nick', :alternative_nickname => 'alternative' }
channel_list = ['#somechannel', '#anotherchan']

connection = { :server_info => server_info, :user_info => user_info, channel_list => channel_list }
connections = [ connection ]
