# frozen_string_literal: true

class Window
  attr_reader :position, :size

  def initialize(delta_rate, size_rate, fullsize = nil)
    # delta_rate: 開始座標（フルサイズとの比率）
    # size_rate: フルサイズと縦横幅の比率

    @sub_windows = []

    @delta_rate = delta_rate
    @size_rate = size_rate
    resize!(fullsize)
  end

  def register_sub(window)
    @sub_windows << window
    resize_sub!
  end

  def resize!(fullsize = nil)
    fullsize = [`tput cols`.to_i, `tput lines`.to_i] if fullsize.nil?
    calc = ->(rate) { [rate[0] * fullsize[0] / 100, rate[1] * fullsize[1] / 100] }

    @position = calc.call(@delta_rate)
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
