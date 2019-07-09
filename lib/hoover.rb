# frozen_string_literal: true

class Hoover
  attr_reader :position_x, :position_y

  def initialize(position_x, position_y)
    @position_x = position_x
    @position_y = position_y
  end

  def move(direction)
    case direction
    when 'N'
      @position_y += 1
    when 'E'
      @position_x += 1
    when 'S'
      @position_y -= 1
    when 'W'
      @position_x -= 1
    end
  end
end
