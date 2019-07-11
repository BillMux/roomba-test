# frozen_string_literal: true

require_relative 'room'

# Leaves every visited square clean
class Hoover
  attr_reader :position_x, :position_y, :room, :position, :patches_cleaned

  def initialize(position_x, position_y, room_x, room_y, dirt)
    out_of_range if position_x > room_x || position_y > room_y
    @position_x = position_x
    @position_y = position_y
    @room = Room.new(room_x, room_y, dirt)
    @room_dim = "#{room_x}x#{room_y}"
    @patches_cleaned = 0
    clean
  end

  def move(instructions)
    instructions.chars.each do |direction|
      change_position(direction)
      clean
      check_off_grid
    end
    "Hoover has moved to (#{@position_x}, #{@position_y})"
  end

  private

  def change_position(direction)
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

  def check_off_grid
    return if on_grid?

    amend_position
    position = "(#{@position_x}, #{@position_y})"
    raise "Out of bounds! Hoover moved back to #{position}"
  end

  def amend_position
    @position_x = @room.length - 1 if @position_x >= @room.length
    @position_y = @room.depth - 1 if @position_y >= @room.depth
    @position_x = 0 if @position_x.negative?
    @position_y = 0 if @position_y.negative?
  end

  def on_grid?
    on_x_plane = @position_x.between?(0, @room.length - 1)
    on_y_plane = @position_y.between?(0, @room.depth - 1)
    on_x_plane && on_y_plane
  end

  def clean
    patch = @room.floor[@position_x][@position_y]
    return unless patch.dirty?

    patch.dirty = false
    @patches_cleaned += 1
    "Patch (#{@position_x}, #{@position_y}) has been cleaned"
  end

  def out_of_range
    raise 'Out of range! Please try again.'
  end
end
