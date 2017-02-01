require_relative 'stepping'
class Pawn < Piece
  include Stepping

  def initialize(pos, color)
    super(pos, color)
    @symbol = :P
  end

  def possible_moves
    get_moves(king)
  end

  def to_s
    "p"
   end
end
