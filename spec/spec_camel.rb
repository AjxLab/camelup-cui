# frozen_string_literal: true

require_relative '../src/camel/camel'

RSpec.describe Camel do
  it 'test create camel' do
    position = [0, 2]
    camel = Camel.new(*position)
    expect(camel.position).to eq position
  end
end
