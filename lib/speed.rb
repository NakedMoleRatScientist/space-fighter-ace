
class Speed
  attr_reader :speed , :movement
  def initialize
    super()
    @speed = 0
    @movement = 0.0
    @move = 0
  end
  def move
    @move += @movement
    if @move > 1
      @object.rect.x += @move.round()
      @move = 0
    end
  end
  def set_speed n
    @speed = n
    @movement = @speed / 10.0
  end
  def left
    set_speed(4)
  end
  def right
    set_speed(4)
  end
end
