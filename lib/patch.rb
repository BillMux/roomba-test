# frozen_string_literal: true

class Patch
  attr_accessor :dirty

  def initialize(x_co, y_co)
    @x_co = x_co
    @y_co = y_co
    @dirty = false
  end

  def dirty?
    @dirty
  end
end
