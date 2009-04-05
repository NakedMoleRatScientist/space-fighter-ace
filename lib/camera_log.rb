
class Camera_Log
  def initialize
    begin
      FileUtils.rm("log/camera.log")
    rescue
    end
    @logger = Logger.new('log/camera.log')
  end
  def new_position x , y , rect
    @logger.debug("Following's absolute location is #{x} , #{y}\n Absolute location: #{rect.x} , #{rect.y}")
  end
end
