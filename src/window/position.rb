# frozen_string_literal: true

class Position
  attr_reader :x, :y

  def initialize(x, y)
    raise ArgumentError unless x >= 0 && y >= 0

    @x = x
    @y = y
  end

  def move_delta(x, y)
    @x += x
    @y += y
  end

  def eql?(other)
    return false unless other.is_a?(self.class)

    @x == other.x && @y == other.y
  end
end
