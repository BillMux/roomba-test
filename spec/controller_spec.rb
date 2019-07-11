# frozen_string_literal: true

require_relative '../lib/controller'

describe Controller do
  subject { described_class.new('./input.txt') }

  it 'accepts a text file and sets vars' do
    expect(subject.room_dimension).to eq '5 5'
    expect(subject.hoover_position).to eq '1 2'
    expect(subject.dirt_positions).to eq ['1 0', '2 2', '2 3']
    expect(subject.instructions).to eq 'NNESEESWNWW'
  end

  it 'can send instructions to the hoover' do
    expect(subject.move_hoover).to eq 'Hoover has moved to (1, 3)'
  end

  it 'return output detailing final position of hoover and clean count' do
    subject.move_hoover
    expect { subject.print_output }.to output("1, 3\n1\n").to_stdout
  end

  it 'returns the position of the hoover and the room dimensions' do
    expect { subject.position_and_dirty_patches }.to output(
      "Position: (1, 2)\nDirt remaining: 3\n"
    ).to_stdout
  end
end
