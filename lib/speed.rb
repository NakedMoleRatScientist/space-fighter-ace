
class Speed < Regulator
  attr_reader :speed , :movement
  def initialize object
    super()
    @object = object
    @speed = 0
    @movement = 0
    @addup = 0.0
    @predicted_position = 0
    setup()
  end
  def setup
    set_action_for_zero {
      @predicted_position = @object.rect.x + @speed
    }
    set_action_for_final {
      @object.rect.x = @predicted_position
      @times = 0
    }
    set_do_in_between {
      @addup += @movement
      if @addup >= 1
	 @object.rect.x += @addup.round()
	 @addup = 0
      end
      @times += 1
    }
  end
  def move
    tick()
  end
  def set_speed n
    @speed = n
    @movement = @speed / 10.0
  end
end
