class Piece
  attr_reader :color
  attr_accessor :pos

  def initialize(pos)
    @pos = pos
  end
end
