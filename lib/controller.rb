# frozen_string_literal: true

require_relative 'hoover'

# Accepts a text file and seperates the lines into the appropriate formats
class Controller
  attr_reader :room_dimension, :hoover_position, :dirt_positions, :instructions
  attr_accessor :hoover

  def initialize(filename)
    file = File.open(filename)
    lines = file.readlines
    lines.map!(&:chomp)
    @room_dimension = lines.shift
    @hoover_position = lines.shift
    @instructions = lines.pop
    @dirt_positions = lines
    setup
  end

  private

  def setup
    hoover_x, hoover_y = split_map_to_i(@hoover_position)
    room_x, room_y = split_map_to_i(@room_dimension)
    dirt = []
    @dirt_positions.each { |coord| dirt << split_map_to_i(coord) }
    @hoover = Hoover.new(hoover_x, hoover_y, room_x, room_y, dirt)
  end

  def split_map_to_i(input)
    input.split.map(&:to_i)
  end
end
