# frozen_string_literal: true

require_relative '../lib/hoover'

describe Hoover do
  subject { described_class.new(1, 2, 5, 5) }

  before(:each) do
    subject.room.floor[1][2].dirty = true
    subject.room.floor[1][3].dirty = true

  end

  describe '#return_position_and_room' do
    it 'returns the position of the hoover and the room dimensions' do
      expect(subject.position_and_room_size).to eq(
        "Position: (1, 2)\nRoom: 5x5"
      )
    end
  end

  context 'can move' do
    it 'to the north' do
      subject.move('N')
      expect(subject.position_y).to eq 3
    end

    it 'to the south' do
      subject.move('S')
      expect(subject.position_y).to eq 1
    end

    it 'to the east' do
      subject.move('E')
      expect(subject.position_x).to eq 2
    end

    it 'to the west' do
      subject.move('W')
      expect(subject.position_x).to eq 0
    end

    it 'multiple steps at a time' do
      expect(subject.move('NNESEESWNWW')).to eq 'Hoover has moved to (1, 3)'
    end
  end

  it 'raise error if outside floor space' do
    expect { described_class.new(3, 3, 1, 1) }.to raise_error(
      'Out of range! Please try again.'
    )
  end

  it 'leaves initial spot clean' do
    new_hoover = described_class.new(3, 3, 5, 5)
    expect(new_hoover.room.floor[3][3]).not_to be_dirty
  end

  describe '#move' do
    it 'cleans each spot after moving' do
      subject.move('N')
      expect(subject.room.floor[1][3]).not_to be_dirty
    end

    it 'returns message detailing position of hoover' do
      expect(subject.move('N')).to eq 'Hoover has moved to (1, 3)'
    end
  end

  it 'cannot exceed boundaries' do
    expect { subject.move('WW') }.to raise_error(
      'Out of bounds! Hoover moved back to (0, 2)'
    )
  end
end
