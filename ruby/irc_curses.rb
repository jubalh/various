require 'rbcurse'
require 'rbcurse/extras/widgets/rlistbox'
require 'rbcurse/core/widgets/rtextview'
require 'rbcurse/core/widgets/rtextarea'
require 'rbcurse/extras/widgets/rvimsplit'
require 'socket'

if $0 == __FILE__
class Caxton
  def initialize
    @window = VER::Window.root_window
    @form = Form.new @window

    vf = :H
    @vim = VimSplit.new @form, {:row => 2, :col => 5, :width => :EXPAND, :height => 50, :orientation => vf, :weight => 0.6}
    lb = Listbox.new nil, :list => ["ruby","perl","lisp","java", "scala"] , :name => "mylist"

    @writearea = TextArea.new @form do
      name "myarea"
      title "write somthing"
      print_footer false
    end

    @chantextview = TextView.new @form do
      name "myview"
      title "look at somthing"
    end

    @vim.add @chantextview, :FIRST, :AUTO
    @vim.add lb, :FIRST, :AUTO
    @vim.add @writearea, :SECOND, :AUTO

    @con = TCPSocket.new("irc.freenode.net", 6667)
    @con.puts( "USER brbi brbi brbi bribi" )
    @con.puts( "NICK brbi" )
    @con.puts( "JOIN #thetestchan" )
    @chanlog = ""

    @help = "F10 to quit. "
    RubyCurses::Label.new @form, {'text' => @help, "row" => 1, "col" => 2, "color" => "yellow"}
    @form.repaint
    @window.wrefresh
    Ncurses::Panel.update_panels
  end

  def run
    while((ch = @window.getchar()) != Ncurses::KEY_F10 )
      if data = @con.readpartial(100)
          @chanlog << data
          @chantextview.set_content @chanlog
      end
      @form.repaint

      ret = @form.handle_key(ch)
      @window.wrefresh
      if ret == :UNHANDLED
        str = keycode_tos ch
        $log.debug " UNHANDLED #{str} by Vim #{ret} "
      end
    end

    @con.close
    @window.destroy
  end
end

  include RubyCurses
  include RubyCurses::Utils
  # Initialize curses
  begin
    # XXX update with new color and kb
    VER::start_ncurses  # this is initializing colors via ColorMap.setup
    $log = Logger.new("rbc13.log")
    $log.level = Logger::DEBUG
    n = Caxton.new
    n.run
  rescue => ex
  ensure
    VER::stop_ncurses
    p ex if ex
    puts(ex.backtrace.join("\n")) if ex
    $log.debug( ex) if ex
    $log.debug(ex.backtrace.join("\n")) if ex
  end
end
