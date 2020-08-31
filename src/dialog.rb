# frozen_string_literal: true

require 'singleton'

class Dialog
  include Singleton
  attr_reader :width, :height, :start_point

  private

  def initialize
    @width = 40
    @height = 8
    @start_point = start_point
  end

  public

  def message(*msg, center: false, start_x: 0, start_y: 0)
    raise ArgumentError unless start_x >= 0 && start_x <= width
    raise ArgumentError unless start_y >= 0 && start_y + msg.length <= height

    print "\e[#{start_point[1] + start_y}B\e[#{start_point[0]}C"

    msg.map! { |line| ' ' * ((width - length(line)) / 2) + line } if center
    msg.map! { |line| ' ' * start_x + "#{line}\e[#{length(line) + start_x}D\e[B" }
    print "\e[40m#{msg.join}\e[0m"

    print "\e[#{start_point[1] + msg.length + start_y}A\e[#{start_point[0]}D"
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
