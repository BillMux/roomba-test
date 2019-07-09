# frozen_string_literal: true

class Room
  attr_reader :length, :depth, :floor_space

  def initialize(length, depth)
    @length = length
    @depth = depth
    @floor_space = create_floor_space
  end

  private

  def create_floor_space
    Array.new(@length) { Array.new(@depth) }
  end
end
