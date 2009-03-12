
class Regulator
  def initialize
    @times = 0
  end
  def set_action_for_zero &action_zero
  end
  def set_action_for_final &acton_ten
  end
  def times_equal_zero? &action
    if @times == 0
      @action.call
    end
  end
  def times_equal_ten? &action
    if @times == 10
      @action.call
    end
  end
end
