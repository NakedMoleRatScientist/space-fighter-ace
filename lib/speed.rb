
class Speed < Regulator
  attr_reader :speed , :movement
  def initialize object
    super()
    @object = object
    @speed = 0
    @movement = 0
    @addup = 0.0
    setup()
  end
  def move
    @addup += @movement
    if @addup >= 1
       @object.rect.x += @addup.round()
       @addup = 0
    end
  end
  def set_speed n
    @speed = n
    @movement = @speed / 10.0
  end
end
