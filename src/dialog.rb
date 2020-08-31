# frozen_string_literal: true

Bundler.require
require 'singleton'

class Dialog
  include Singleton
  attr_reader :width, :height

  def initialize
    @width = 40
    @height = 7
  end
end
