# frozen_string_literal: true

class Window
  attr_reader :position

  def initialize(delta, size, fullsize = nil)
    # delta: 画面左上の座標（フルサイズとの比率）
    # size: フルサイズと縦横幅の比率

    # 開始座標/画面サイズ を計算
    fullsize = [`tput cols`.to_i, `tput lines`.to_i] if fullsize.is_nil?
    calc = ->(rate) { [rate[0] * fullsize[0] / 100, rate[1] * fullsize[1] / 100] }
    @position = calc.call(delta)
    @size_x = calc.call(size)

    # 内包するウィンドウの配列
    @sub_windows = []
  end

  def register_sub(window)
    @sub_windows << window
  end

  def draw
    raise 'call abstract!'
  end

  def map
    raise 'call abstract!'
  end
end
