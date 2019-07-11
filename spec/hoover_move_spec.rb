# frozen_string_literal: true

require_relative '../lib/hoover'

describe 'Hoover#move' do
  subject { Hoover.new(1, 2, 5, 5, [[1, 2], [1, 3]]) }

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

  it 'cleans each spot after moving' do
    subject.move('N')
    expect(subject.room.floor[1][3]).not_to be_dirty
  end

  it 'returns message detailing position of hoover' do
    expect(subject.move('N')).to eq 'Hoover has moved to (1, 3)'
    expect(subject.move('NESEESWNWW')).to eq 'Hoover has moved to (1, 3)'
  end
end
