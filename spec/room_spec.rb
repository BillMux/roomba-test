# frozen_string_literal: true

require_relative '../lib/room'

describe Room do
  subject { described_class.new(5, 5, [[1, 1]]) }

  it 'should have length and depth' do
    expect(subject.length).to eq 5
    expect(subject.depth).to eq 5
  end

  it 'should create an array of dimension length x width' do
    expect(subject.floor).to be_an_instance_of Array
    expect(subject.floor.length).to eq 5
    subject.floor.each do |row|
      expect(row.length).to eq 5
      expect(row).to be_an_instance_of Array
    end
  end

  it 'has dirty floor patches' do
    subject.locate_dirt
    expect(subject.floor[1][1]).to be_dirty
  end
end
