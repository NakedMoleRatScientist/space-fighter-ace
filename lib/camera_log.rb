
class Camera_Log
  def initialize
    @logger = Logger.new('log/camera.log')
  end
  def new_position x , y , rect
    @logger.debug("new position of object being followed by camera: #{x} , #{y}")
    @logger.debug("absolute location of object on the map: #{rect.x}, #{rect.y}")
  end
end
