# frozen_string_literal: true

require_relative '../lib/patch'

describe Patch do
  subject { described_class.new(1, 1) }

  it 'has x and y coordinates' do
    expect(subject.x_co).to eq 1
    expect(subject.y_co).to eq 1
  end

  it 'can be dirty' do
    expect(subject).not_to be_dirty
  end
end
