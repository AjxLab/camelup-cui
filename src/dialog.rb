# frozen_string_literal: true

require 'singleton'

class Dialog
  include Singleton
  attr_reader :width, :height

  private

  def initialize
    @width = 40
    @height = 8
  end

  public

  def message(*msg, center: false, x: 0, y: 0)
    raise ArgumentError unless x >= 0 && x <= width
    raise ArgumentError unless y >= 0 && y + msg.length <= height

    print "\e[#{start_point[1] + y}B\e[#{start_point[0]}C"

    msg.map! { |line| ' ' * ((width - length(line)) / 2) + line } if center
    msg.map! { |line| ' ' * x + "#{line}\e[#{length(line) + x}D\e[B" }
    print "\e[40m#{msg.join}\e[0m"

    print "\e[#{start_point[1] + msg.length + y}A\e[#{start_point[0]}D"
  end

  def reset
    message *frame
  end

  private

  def frame
    result = []

    height.times do |_y|
      result << "\e[40m \e[0m" * width
    end

    result
  end

  def start_point
    [
      `tput cols`.to_i / 2 - width / 2,
      `tput lines`.to_i / 2 - height / 2
    ]
  end

  def length(str)
    str = str.gsub /\e\[\d*[ABCDm]/, ''
    str.length + str.chars.reject(&:ascii_only?).length
  end
end
