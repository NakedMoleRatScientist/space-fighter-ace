
class Regulator
  def initialize
    @times = 0
  end
  def set_action_for_zero &action_zero
  end
  def set_action_for_final &acton_ten
  end
  def set_do_in_between &action_between
  end
  def tick
    times_equal_zero?
    @action_between.call
    times_equal_ten?
  end
  def times_equal_zero?
    if @times == 0
      @action_zero.call
    end
  end
  def times_equal_ten?
    if @times == 10
      @action_ten.call
    end
  end
end
