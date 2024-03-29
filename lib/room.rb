# frozen_string_literal: true

require_relative 'patch'

# The room the hoover robot has been assigned to clean
class Room
  attr_reader :length, :depth
  attr_accessor :floor

  def initialize(length, depth, dirt = [])
    @length = length
    @depth = depth
    @floor = create_floor_space
    @dirt = dirt
    locate_dirt
  end

  private

  def create_floor_space
    Array.new(@length) { |x| Array.new(@depth) { |y| Patch.new(x, y) } }
  end

  def locate_dirt
    @dirt.each { |x, y| @floor[x][y].dirty = true }
  end
end
