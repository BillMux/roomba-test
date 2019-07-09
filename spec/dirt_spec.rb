# frozen_string_literal: true

require_relative '../lib/dirt'

describe Dirt do
  subject { described_class.new(1, 1) }

  it 'has x and y coordinates' do
    expect(subject.x_co).to eq 1
    expect(subject.y_co).to eq 1
  end
end
