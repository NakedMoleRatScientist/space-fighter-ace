
class Speed
  attr_reader :speed , :movement , :position
  def initialize
    @speed = 0
    @movement = 0
    @position = 0.0
    @addup = 0.0
    @predicted_position = 0
    @times = 0
  end
end
