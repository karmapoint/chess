require_relative "stepping"
class Knight < Piece
  include Stepping

  def initialize(pos, color)
    super(pos, color)
    @symbol = :k
  end

  def possible_moves
    get_moves(knight)
  end

  def to_s
    "k"
   end
end
