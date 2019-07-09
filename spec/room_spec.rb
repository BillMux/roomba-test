# frozen_string_literal: true

require_relative '../lib/room'

describe Room do
  subject { described_class.new(5, 5, [[1, 1]]) }

  it 'has dirty floor patches' do
    expect(subject.floor[1][1]).to be_dirty
  end
end
