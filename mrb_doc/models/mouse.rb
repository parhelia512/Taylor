class Mouse
  # Returns true the frame after the {Mouse} button has been pressed, but will
  # return false for the following frames until the button is re-pressed.
  #
  # @example Basic usage
  #   puts Mouse.pressed?(Mouse::LEFT) #=> false
  #
  #   # User holds down their left mouse button
  #   puts Mouse.pressed?(Mouse::LEFT) #=> true
  #
  #   # One frame passes, left mouse button still held down
  #   puts Mouse.pressed?(Mouse::LEFT) #=> false
  #
  # @param button [Integer]
  # @return [Boolean]
  def self.pressed?(button)
    # mrb_Mouse_pressed?
    # src/mruby_integration/models/mouse.cpp
    true
  end

  # Returns true if the button is being held down.
  #
  # @example Basic usage
  #   puts Mouse.down?(Mouse::LEFT) #=> false
  #
  #   # User holds down their left mouse button
  #   puts Mouse.down?(Mouse::LEFT) #=> true
  #
  #   # One frame passes, left mouse button still held down
  #   puts Mouse.down?(Mouse::LEFT) #=> true
  #
  #   # User releases the button and one frame passes
  #   puts Mouse.down?(Mouse::LEFT) #=> false
  #
  # @param button [Integer]
  # @return [Boolean]
  def self.down?(button)
    # mrb_Mouse_down?
    # src/mruby_integration/models/mouse.cpp
    true
  end

  # Returns true the frame after the {Mouse} button has been released, but will
  # return false for the following frames until the button is released again.
  #
  # @example Basic usage
  #   puts Mouse.released?(Mouse::LEFT) #=> false
  #
  #   # User releases their left mouse button
  #   puts Mouse.released?(Mouse::LEFT) #=> true
  #
  #   # One frame passes, left mouse button still released
  #   puts Mouse.released?(Mouse::LEFT) #=> false
  #
  # @param button [Integer]
  # @return [Boolean]
  def self.released?(button)
    # mrb_Mouse_released?
    # src/mruby_integration/models/mouse.cpp
    true
  end

  # Returns true if the button is not being held down.
  #
  # @example Basic usage
  #   puts Mouse.up?(Mouse::LEFT) #=> true
  #
  #   # User holds down their left mouse button
  #   puts Mouse.up?(Mouse::LEFT) #=> false
  #
  #   # One frame passes, left mouse button still held down
  #   puts Mouse.up?(Mouse::LEFT) #=> false
  #
  #   # User releases the button and one frame passes
  #   puts Mouse.up?(Mouse::LEFT) #=> true
  #
  # @param button [Integer]
  # @return [Boolean]
  def self.up?(button)
    # mrb_Mouse_up?
    # src/mruby_integration/models/mouse.cpp
    true
  end

  # Returns the {Mouse} position as a {Vector2}.
  #
  # @example Basic usage
  #   puts Mouse.position
  #   # => Vector2[10, 15]
  #
  # @return [Vector2]
  def self.position
    # mrb_Mouse_position
    # src/mruby_integration/models/mouse.cpp
    Vector2[10, 15]
  end

  # Sets the position of the {Mouse}.
  #
  # @example Basic usage
  #   puts Mouse.position
  #   # => Vector2[10, 15]
  #
  #   Mouse.position = Vector2[20, 45]
  #   puts Mouse.position
  #   # => Vector2[20, 45]
  #
  # @param vector [Vector2]
  # @return [nil]
  def self.position=(vector)
    # mrb_Mouse_set_position
    # src/mruby_integration/models/mouse.cpp
    nil
  end

  # Sets the offset of the {Mouse}. This will effect all future
  # {Mouse.position} checks.
  #
  # @example Basic usage
  #   puts Mouse.position
  #   # => Vector2[10, 15]
  #
  #   Mouse.offset = Vector[5, 10]
  #   puts Mouse.position
  #   # => Vector2[15, 25]
  #
  #   Mouse.position = Vector2[20, 45]
  #   puts Mouse.position
  #   # => Vector2[25, 55]
  #
  # @param vector [Vector2]
  # @return [nil]
  def self.offset=(vector)
    # mrb_Mouse_set_offset
    # src/mruby_integration/models/mouse.cpp
    nil
  end

  # Sets the scaling of the {Mouse}. This will affect all future
  # {Mouse.position} checks.
  #
  # @example Basic usage
  #   puts Mouse.position
  #   # => Vector2[10, 15]
  #
  #   Mouse.scale = Vector[0.5, 2]
  #   puts Mouse.position
  #   # => Vector2[5, 30]
  #
  #   # The player moves their mouse around
  #
  #   puts Mouse.position
  #   # => Vector2[200, 300]
  #
  #   Mouse.scale = Vector[1, 1]
  #   puts Mouse.position
  #   # => Vector2[400, 150]
  #
  # @param vector [Vector2]
  # @return [nil]
  def self.scale=(vector)
    # mrb_Mouse_set_scale
    # src/mruby_integration/models/mouse.cpp
    nil
  end

  # Returns the amount the scroll wheel has moved since last frame as a
  # {Vector2} where {Vector2#y} is scrolling up and down and {Vector2#x} is
  # scrolling left and right.
  #
  # @example Basic usage
  #   puts Mouse.wheel_moved # => Vector2[0, 0]
  #
  #   # User scrolls up
  #   puts Mouse.wheel_moved # => Vector2[0, 1]
  #
  #   # User scrolls down
  #   puts Mouse.wheel_moved # => Vector2[0, -1]
  #
  #   # User scrolls left
  #   puts Mouse.wheel_moved # => Vector2[1, 0]
  #
  #   # User scrolls right
  #   puts Mouse.wheel_moved # => Vector2[-1, 0]
  #
  # @return [Vector2]
  def self.wheel_moved
    # mrb_Mouse_wheel_moved
    # src/mruby_integration/models/mouse.cpp
    Vector2[0, 2]
  end
end
