# frozen_string_literal: true

class Window
  attr_reader :position, :size
  attr_reader :sub_windows

  def initialize(pos_rate, size_rate, fullsize = nil)
    # pos_rate: フルサイズと開始座標の比率
    # size_rate: フルサイズと縦横幅の比率
    raise ArgumentError unless pos_rate[0] + size_rate[0] <= 100
    raise ArgumentError unless pos_rate[1] + size_rate[1] <= 100

    @sub_windows = []

    @pos_rate = pos_rate
    @size_rate = size_rate
    resize!(fullsize)
  end

  def register_sub!(window)
    @sub_windows << window
    resize_sub!
  end

  def unregister_sub!(window)
    @sub_windows.delete(window)
  end

  def resize!(fullsize = nil)
    fullsize = [`tput cols`.to_i, `tput lines`.to_i] if fullsize.nil?
    calc = ->(rate) { [rate[0] * fullsize[0] / 100, rate[1] * fullsize[1] / 100] }

    @position = calc.call(@pos_rate)
    @size = calc.call(@size_rate)

    resize_sub!
  end

  def resize_sub!
    @sub_windows.each { |window| window.resize!(@size) }
  end

  def draw
    raise 'call abstract!'
  end

  def map
    raise 'call abstract!'
  end
end
