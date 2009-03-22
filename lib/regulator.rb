
class Regulator
  def initialize
    @timer = Array.new()
  end
  def set_action &action
    @timer << action
  end
  def call_all
    @timer.each do |object|
      object.call()
    end
  end
end
