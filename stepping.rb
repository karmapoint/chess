module Stepping

  def king
    [[1,1], [-1,-1], [1,-1], [-1,1], [1,0], [0,1], [-1,0], [0,-1]]
  end

  def knight
    [[1,2],[2,1],[-1,-2],[-1,2],[1,-2],[-2,1],[-2,-2],[2,-1]]
  end

  # USING KING DIRECTIONS FOR PAWN TESTING PURPOSES ONLY!!!
  
  def pawn
    [[1,1], [-1,-1], [1,-1], [-1,1], [1,0], [0,1], [-1,0], [0,-1]]
  end

  def get_moves(directions)
    moves =[]
    directions.each do |direction|
      current_pos = @pos.dup
      current_pos[0] += direction[0]
      current_pos[1] += direction[1]
      if current_pos[0].between?(0,7) && current_pos[1].between?(0,7)
        moves << current_pos.dup unless current_pos == @pos
      end
    end
    moves
  end


end
