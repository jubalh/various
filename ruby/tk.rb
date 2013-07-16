require 'tk'
require 'tkextlib/tile'

root = TkRoot.new

content_area = Tk::Tile::Frame.new(root)
content_area['padding'] = '5'
content_area.grid :column => 0, :row => 0

channels = TkListbox.new(content_area) {height 550, width 230}
channels.grid :column => 0, :row => 0, :columnspan => 2

topic = TK::Tile::Label.new(content_area) {text 'TOPIC'}
topic.grid :column => 1, :row => 1

nicklist = TkListbox.new(content_area) {height 550, width 230}
nicklist.grid :column => 2, :row => 0, :rowspan => 2

conversation = TK::Tile::Label.new(content_area) {text 'here comes alle the talking', width 700}
lb
conversation.grid :column => 1, :row => 1
#hier eignetlich Text statt label nehmen
#sogar mit tags zum higlighten usw. perfekt! http://www.tkdocs.com/tutorial/text.html

$user_say = TkVaribale.new
input = TK::Tile::Entry(content_area) { textvariable $user_say }
input.grind :column => 0, :row => 2, :columnspan => 2

send = TK::Tile::Button.new(content_area) {text 'send'; command 'submit_func'}
send.grind :column => 2, :row => 2

