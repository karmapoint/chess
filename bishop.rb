require_relative "sliding"

class Bishop < Piece

   include Sliding

   def initialize(pos, color)
     super(pos, color)
     @symbol = :B
   end

   def possible_moves
     get_moves(diagonal)
   end

   def to_s
    "B"
   end


end
