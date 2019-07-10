class Controller
  attr_reader :room_dimension, :hoover_position, :dirt_positions, :instructions

  def initialize(filename)
    file = File.open(filename)
    lines = file.readlines
    lines.map! { |x| x.chomp }
    @room_dimension = lines.shift
    @hoover_position = lines.shift
    @instructions = lines.pop
    @dirt_positions = lines
  end
end
