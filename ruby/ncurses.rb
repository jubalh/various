require 'ncurses'
require 'logger'

VER::start_ncurses
@win = VER::Window.root_window
@window.printstring 0, 30, "Demo of Ruby Curses Widgets - rbcurse", $normalcolor, 'reverse'

while((ch = @window.getchar()) != KEY_F1 )
end

window.destroy
