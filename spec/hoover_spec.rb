# frozen_string_literal: true

require_relative '../lib/hoover'

describe Hoover do
  subject { described_class.new(1, 2, 5, 5, [[1, 2], [1, 3]]) }

  describe '#return_position_and_room' do
    it 'returns the position of the hoover and the room dimensions' do
      expect(subject.position_and_room_size).to eq(
        "Position: (1, 2)\nRoom: 5x5"
      )
    end
  end

  it 'raise error if outside floor space' do
    expect { described_class.new(3, 3, 1, 1, [[1, 2], [1, 3]]) }.to raise_error(
      'Out of range! Please try again.'
    )
  end

  it 'leaves initial spot clean' do
    new_hoover = described_class.new(3, 3, 5, 5, [[1, 2], [1, 3]])
    expect(new_hoover.room.floor[3][3]).not_to be_dirty
  end

  it 'cannot exceed boundaries' do
    expect { subject.move('WW') }.to raise_error(
      'Out of bounds! Hoover moved back to (0, 2)'
    )
  end
end
