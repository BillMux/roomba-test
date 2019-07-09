# frozen_string_literal: true

require_relative 'room'

class Hoover
  attr_reader :position_x, :position_y

  def initialize(position_x, position_y, room_x, room_y)
    out_of_range if position_x > room_x || position_y > room_y
    @position_x = position_x
    @position_y = position_y
    @room = Room.new(room_x, room_y)
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

  private

  def out_of_range
    raise 'Out of range! Please try again.'
  end
end
