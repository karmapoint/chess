require_relative 'stepping'
class King < Piece
  include Stepping
  def initialize(pos, color)
    super(pos, color)
    @symbol = :K
  end

  def possible_moves
    get_moves(king)
  end

  def to_s
    "K"
   end
end
