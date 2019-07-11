# frozen_string_literal: true

# A small patch of the floor to be cleaned, as represented
# by an element containing a boolean dirty var
class Patch
  attr_accessor :dirty

  def initialize(x_co, y_co, dirty = false)
    @x_co = x_co
    @y_co = y_co
    @dirty = dirty
  end

  def dirty?
    @dirty
  end
end
