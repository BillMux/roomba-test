# frozen_string_literal: true

require_relative 'room'

class Hoover
  attr_reader :position_x, :position_y, :room

  def initialize(position_x, position_y, room_x, room_y)
    out_of_range if position_x > room_x || position_y > room_y
    @position_x = position_x
    @position_y = position_y
    @room = Room.new(room_x, room_y)
    clean
  end

  def move(direction)
    clean
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
    clean
  end

  private

  def clean
    p @position_x, @position_y
    p @room.floor[@position_x][@position_y].dirty?
    @room.floor[@position_x][@position_y].dirty = false
    p @room.floor[@position_x][@position_y].dirty?
  end

  def out_of_range
    raise 'Out of range! Please try again.'
  end
end
