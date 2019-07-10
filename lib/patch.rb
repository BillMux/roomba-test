# frozen_string_literal: true

class Patch
  attr_accessor :dirty

  def initialize(x_co, y_co, dirty = [false, true].sample)
    @x_co = x_co
    @y_co = y_co
    @dirty = dirty
  end

  def dirty?
    @dirty
  end
end
