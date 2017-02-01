module Sliding

  def diagonal
    [[1,1], [-1,-1], [1,-1], [-1,1]]
  end

  def vertical
    [[-1,0],[1,0]]
  end

  def horizontal
    [[0,-1],[0, 1]]
  end

  def get_moves(directions)
    moves =[]
    directions.each do |direction|
      current_pos = @pos.dup
      while current_pos[0].between?(0,7) && current_pos[1].between?(0,7)
        moves << current_pos.dup unless current_pos == @pos
        current_pos[0] += direction[0]
        current_pos[1] += direction[1]
      end
    end
    moves
  end
end
