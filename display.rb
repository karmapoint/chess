require "colorize"
require_relative "board"
require_relative "cursor.rb"
require 'byebug'

class Display
  attr_reader :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
    @selected = []
  end

  def test_game
    until won?
      until @selected.length == 2
        system("clear")
        render
        puts "select location"
        @cursor.get_input
        if @cursor.selected_pos
          @selected << @cursor.selected_pos
          @cursor.selected_pos = nil
        end
      end
      p @selected
      board.move_piece(@selected[0].reverse, @selected[1].reverse)
      @selected = []
    end
  end

  def won?
    false
  end


  def render
    system ("clear")
    puts "    #{(0..7).to_a.join("  ")} ".colorize(:background => :light_cyan)
    8.times do |j|
        print " #{j} ".colorize(:background => :light_cyan)
      8.times do |i|
        if @cursor.cursor_pos == [i,j]
          if @selected.length == 0
            print " #{@board.grid[j][i]} ".colorize(:color => :white, :background => :blue)
          else
            print " #{@board.grid[j][i]} ".colorize(:color => :white, :background => :light_cyan)
          end
        elsif i.even? && j.even? && @cursor_pos != [i,j]
          print " #{@board.grid[j][i]} ".colorize(:color => :white, :background => :red)
        elsif j.odd? && i.odd?  && @cursor_pos != [i,j]
          print " #{@board.grid[j][i]} ".colorize(:color => :white, :background => :red)
        else
          print " #{@board.grid[j][i]} "
        end
      end
      puts
    end
  end

end

d = Display.new
d.test_game
