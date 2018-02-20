require_relative 'board'

class Display(board)
  def initialize
    @board = Board.new
  end
end
