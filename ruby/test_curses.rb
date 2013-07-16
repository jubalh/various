require 'rubygems'
require 'rubygems'
require 'ncurses'


def create_window(height, width, starty, startx)
  window = Ncurses.newwin(height, width, starty, startx)
  Ncurses.box(window, 0, 0) # 0, 0 gives default characters for the vertical
                            # and horizontal lines
  Ncurses.wrefresh(window) # show that box
  window
end

scr = Ncurses.initscr;
#Ncurses.printw "hey there"
create_window(20,20,1,1)

while((ch = scr.getch()) != Ncurses::KEY_ESC) do
	Ncurses.refresh
end

Ncurses.endwin
