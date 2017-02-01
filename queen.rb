require_relative "sliding"

class Queen < Piece
  include Sliding

  def initialize(pos, color)
    super(pos, color)
    @symbol = :Q
  end

  def possible_moves
    get_moves(diagonal + horizontal + vertical)
  end

  def to_s
    "Q"
   end
end
