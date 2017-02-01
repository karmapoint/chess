require_relative "manifest"

class Board
  attr_reader :board, :grid
  def initialize
    @grid = Array.new(8) { Array.new}
    setup_grid(@grid)
  end

  def setup_grid(grid)
    @grid[0] << Rook.new([0,0], :black)
    @grid[0] << Knight.new([0,1], :black)
    @grid[0] << Bishop.new([0,2], :black)
    @grid[0] << King.new([0,3], :black)
    @grid[0] << Queen.new([0,4], :black)
    @grid[0] << Bishop.new([0,5], :black)
    @grid[0] << Knight.new([0,6], :black)
    @grid[0] << Rook.new([0,7], :black)

    @grid[7] << Rook.new([7,0], :white)
    @grid[7] << Knight.new([7,1], :white)
    @grid[7] << Bishop.new([7,2], :white)
    @grid[7] << Queen.new([7,3], :white)
    @grid[7] << King.new([7,4], :white)
    @grid[7] << Bishop.new([7,5], :white)
    @grid[7] << Knight.new([7,6], :white)
    @grid[7] << Rook.new([7,7], :white)

    grid.each_with_index do |row, i|
      if i == 6
        8.times { |x| row << Pawn.new([i,x], :white) }
      elsif i == 1
        8.times { |x| row << Pawn.new([i, x], :black) }
      elsif i.between?(2,5)
        8.times { |x| row << NullPiece.instance }
      end
    end
  end

  def valid_move(start_pos, end_pos)
    current_color =  @grid[start_pos[0]][start_pos[1]].color
    moves = @grid[start_pos[0]][start_pos[1]].possible_moves

    moves.include?(end_pos)

    # occupied_moves = moves.reject do |pos|
    #   @grid[pos[0]][pos[1]].class == NullPiece
    # end
    #
    # unoccupied_moves = moves.select do |pos|
    #   @grid[pos[0]][pos[1]].class == NullPiece
    # end
  end

  def move_piece(start_pos, end_pos)
    if valid_move(start_pos, end_pos)
      start_piece = @grid[start_pos[0]][start_pos[1]]
      raise "No piece at that starting position!" if start_piece.class == NullPiece

      end_piece = @grid[end_pos[0]][end_pos[1]]
      raise "You can't move to that location" unless end_piece.class == NullPiece

      @grid[start_pos[0]][start_pos[1]] = end_piece
      @grid[end_pos[0]][end_pos[1]] = start_piece

      start_piece.pos = end_pos
    else
      puts "That piece can't move that way!"
      sleep(1)
    end

  end

  def in_bounds?(pos)
    return true if pos[0] < 0 || pos[0] > 7
    return true if pos[1] < 0 || pos[1] > 7
    false
  end

  def [](pos)
    row, col = pos
    @grid[pos]
  end

  def []=(pos, value)
    row, col = pos
    @grid[pos] = value
  end
end
