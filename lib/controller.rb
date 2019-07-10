require_relative 'hoover'

class Controller
  attr_reader :room_dimension, :hoover_position, :dirt_positions, :instructions
  attr_accessor :hoover

  def initialize(filename)
    file = File.open(filename)
    lines = file.readlines
    lines.map! { |x| x.chomp }
    @room_dimension = lines.shift
    @hoover_position = lines.shift
    @instructions = lines.pop
    @dirt_positions = lines
    setup
  end

  private

  def setup
    hoover_x = @hoover_position.split[0].to_i
    hoover_y = @hoover_position.split[1].to_i
    room_x = @room_dimension.split[0].to_i
    room_y = @room_dimension.split[1].to_i
    @hoover = Hoover.new(hoover_x, hoover_y, room_x, room_y)
  end
end
