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

  it 'creates new instance of hoover' do
    expect(subject.hoover).to be_an_instance_of Hoover
  end
end
