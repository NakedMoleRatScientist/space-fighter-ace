
class Speed < Regulator
  attr_reader :speed , :movement , :position
  def initialize player
    @player = player
    @speed = 0
    @movement = 0
    @position = 0.0
    @addup = 0.0
    @predicted_position = 0
    @times = 0
  end
  def move
    if @times == 0
      @predicted_position = @player.rect.x + @speed
    end
    @position += @movement
    @addup += @movement
    @times += 1
    if @addup >= 1
      @addup = 0.0
      @player.rect.x += 1
    end
    if @times == 10
      @player.rect.x = @predicted_position
      @times = 0
    end
  end
  def set_speed n
    @speed = n
    @movement = @speed / 10.0
  end
end
