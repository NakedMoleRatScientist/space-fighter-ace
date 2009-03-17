

class Test_Space_Object_Speed < Test::Unit::TestCase
  def setup
    @engine = GameEngine.new()
    @player = Player.new(@engine)
  end
  def test_initial
    assert @player.speed.speed == 0
    assert @player.speed.movement == 0.0
  end
  def test_set_velocity
    @player.speed.set_speed(4)
    assert @player.speed.speed == 4
    assert @player.speed.movement == 0.4
    assert @player.rect.x == 0
  end
  def test_set_velocity_and_move
    @player.speed.set_speed(4)
    assert @player.speed.speed == 4
    assert @player.speed.movement == 0.4
    assert @player.rect.x == 0
    move(10)
    assert @player.rect.x == 4
  end
  def test_set_velocity_part_way
    @player.speed.set_speed(4)
    assert @player.speed.speed == 4
    assert @player.speed.movement == 0.4
    assert @player.rect.x == 0
    move(3)
    assert @player.rect.x == 1
  end
  def test_time_test
    @player.speed.set_speed(4)
    state = false
    timer = Timer.new(1.1) {
      state = true
    }
    timer.start()
    loop do
      if state == true
	break
      end
      timer.check()
      @player.act()
    end
    assert @player.rect.x == 4
  end
  def move t
    t.times do
      @player.speed.move()
    end
  end
end
