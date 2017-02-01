require 'singleton'
class NullPiece < Piece
  include Singleton

  def initialize
  end

  def inspect
    "null"
  end

  def to_s
    " "
  end

end
