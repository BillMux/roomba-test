# frozen_string_literal: true

require_relative '../lib/hoover'

describe Hoover do
  let(:patch) { double :patch, x_co: 3, y_co: 3, dirty: true }
  # let(:room) {
  #   double :room,
  #   length: 5,
  #   depth: 5,
  #   dirt: [3, 3],
  #   floor: Array.new(5) { Array.new(5) }
  # }
  # let(:room) { Room.new(5, 5, [[3, 3]]) }
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

  it 'leaves every space nice and clean' do
    subject.move('N')
    expect(subject.room.floor[3][3]).not_to be_dirty
  end
end
