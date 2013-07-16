require 'rbcurse'
require 'rbcurse/extras/widgets/rlistbox'
require 'rbcurse/core/widgets/rtextview'
require 'rbcurse/core/widgets/rtextarea'
require 'rbcurse/extras/widgets/rvimsplit'

if $0 == __FILE__
class IRCWindow
  def run
    @window = VER::Window.root_window
    @form = Form.new @window

    vf = :H
    @vim = VimSplit.new @form, {:row => 2, :col => 5, :width => :EXPAND, :height => 25, :orientation => vf, :weight => 0.6}
    lb = Listbox.new nil, :list => ["ruby","perl","lisp","java", "scala"] , :name => "mylist"
    #or: @vim.add ["mercury","venus","earth","mars","jupiter", "saturn"], :FIRST, :AUTO

    #lb2 = Listbox.new nil, :list => `gem list --local`.split("\n") , :name => "mylist2"

	area = TextArea.new @form do
		name "myarea"
		title "write somthing"
		print_footer true
	end

    alist = %w[ ruby perl python java jruby macruby rubinius rails rack sinatra gawk zsh bash groovy] 
    str = "Hello people of this world.\nThis is a textbox.\nUse arrow keys, j/k/h/l/gg/G/C-a/C-e/C-d/C-b\n"
    str << alist.join("\n")
    stfl = vf == :V ? :FLOW : :STACK
    @vim.add lb, :FIRST, :AUTO #FIRST = row
    @vim.add alist, :FIRST, 0.4, stfl
    #@vim.add alist, :FIRST, nil, stfl
    @vim.add alist.shuffle, :FIRST, 0.6, stfl
    @vim.add str, :SECOND, :AUTO
    str2 = "so you are here!"
    @vim.add str2, :SECOND, :AUTO
	@vim.add area, :SECOND, :AUTO

    #
    @help = "F10 to quit. "
    RubyCurses::Label.new @form, {'text' => @help, "row" => 1, "col" => 2, "color" => "yellow"}
    @form.repaint
    @window.wrefresh
    Ncurses::Panel.update_panels
    while((ch = @window.getchar()) != Ncurses::KEY_F10 )
      ret = @form.handle_key(ch)
      @window.wrefresh
      if ret == :UNHANDLED
        str = keycode_tos ch
        $log.debug " UNHANDLED #{str} by Vim #{ret} "
      end
    end

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
    n = IRCWindow.new
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
