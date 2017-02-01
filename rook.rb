require_relative "sliding"

class Rook < Piece
  include Sliding
  def initialize(pos, color)
    super(pos, color)
    @symbol = :R
  end

  def possible_moves
    get_moves(horizontal + vertical)
  end

  def to_s
    "R"
   end

end
