# frozen_string_literal: true

require_relative 'room'

class Hoover
  attr_reader :position_x, :position_y, :room, :position

  def initialize(position_x, position_y, room_x, room_y)
    out_of_range if position_x > room_x || position_y > room_y
    @position_x = position_x
    @position_y = position_y
    @room = Room.new(room_x, room_y)
    @room_dim = "#{room_x}x#{room_y}"
    @position = "(#{@position_x}, #{@position_y})"
    clean
  end

  def return_position_and_room
    "Position: #{@position}\nRoom: #{@room_dim}"
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
    clean
    "Hoover has moved to (#{@position_x}, #{@position_y})"
  end

  private

  def clean
    patch = @room.floor[@position_x][@position_y]
    if patch.dirty?
      patch.dirty = false
      "Patch (#{@position_x}, #{@position_y}) has been cleaned"
    end
  end

  def out_of_range
    raise 'Out of range! Please try again.'
  end
end
