# frozen_string_literal: true

require 'singleton'

class Dialog
  include Singleton
  attr_reader :width, :height, :start_point

  private

  def initialize
    @width = 40
    @height = 7
    @start_point = start_point
  end

  public

  def draw_frame
    print "\e[#{start_point[1]}B\e[#{start_point[0]}C"
    print frame
    print "\e[#{start_point[1] + height}A\e[#{start_point[0]}D"
  end

  private

  def frame
    result = ''

    height.times do |_y|
      result += "\e[40m \e[0m" * width
      result += "\e[B\e[#{width}D"
    end

    result
  end

  def start_point
    [
      `tput cols`.to_i / 2 - width / 2,
      `tput lines`.to_i / 2 - height / 2
    ]
  end
end
