require "colorize"

class Piece
  attr_reader :color
  attr_accessor :pos
  COLORS = [:black, :white, :null]

  def initialize(pos, color)
    @pos = pos
    @color = color
  end



  def inspect
    "piece"
  end

  def to_s
    "X"
  end
end
