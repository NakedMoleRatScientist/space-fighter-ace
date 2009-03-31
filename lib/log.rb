
class Log
  def initialize
    @logger = Logger.new('log.log')
  end
  def new_position x , y
    @logger.debug("new position of object being followed by camera: #{x} , #{y}")
  end
end
