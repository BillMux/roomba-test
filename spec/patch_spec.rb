# frozen_string_literal: true

require_relative '../lib/patch'

describe Patch do
  subject { described_class.new(1, 1) }

  it 'can be dirty' do
    expect(subject).not_to be_dirty
  end
end
