# frozen_string_literal: true

class Camel
  attr_reader :position

  def initialize(x, y)
    raise ArgumentError unless x >= 0 && y >= 0

    @x = x
    @y = y
  end
end
