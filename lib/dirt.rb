# frozen_string_literal: true

# require_relative 'room'

class Dirt
  attr_reader :x_co, :y_co

  def initialize(x_co, y_co)
    @x_co = x_co
    @y_co = y_co
  end
end
