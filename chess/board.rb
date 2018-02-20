require_relative 'piece'

class Board
  attr_reader :board
  def initialize
    @grid = Array.new(8) { Array.new }
    [0, 1, 6, 7].each do |idx|
      8.times { |col| self.grid[idx] << Piece.new([idx, col]) }
    end
    [2..5].each do |idx|
      8.times { self.grid[idx] << nil }
    end
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at #{start_pos}" if self[start_pos].nil?
    raise "Cannot move to #{end_pos}" unless self[end_pos].nil?
    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
    piece.pos = end_pos
  end

  def [](pos)
    row, col = pos
    self.grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    self.grid[row][col] = value
  end
end
