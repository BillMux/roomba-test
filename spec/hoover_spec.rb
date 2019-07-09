# frozen_string_literal: true

require_relative '../lib/hoover'

describe Hoover do
  subject { described_class.new(3, 3, 5, 5) }

  context 'can move' do
    it 'to the north' do
      subject.move('N')
      expect(subject.position_y).to eq 4
    end

    it 'to the south' do
      subject.move('S')
      expect(subject.position_y).to eq 2
    end

    it 'to the east' do
      subject.move('E')
      expect(subject.position_x).to eq 4
    end

    it 'to the west' do
      subject.move('W')
      expect(subject.position_x).to eq 2
    end
  end

  it 'raise error if outside floor space' do
    expect{ described_class.new(3, 3, 1, 1) }.to raise_error(
      'Out of range! Please try again.'
    )
  end
end
