

class Test_Space_Object_Movement < Test::Unit::TestCase
  def setup
    @engine = GameEngine.new()
    @player = Player.new(@engine)
  end
  def test_initial
    assert @player.speed == 0
    assert @player.movement == 0.0
  end
  def test_set_velocity
    @player.set_velocity(4)
    assert @player.speed == 4
    assert @player.movement == 0.4
    assert @player.position == 0
    assert @player.rect.x == 0
  end
  def test_set_velocity_and_move
    @player.set_velocity(4)
    assert @player.speed == 4
    assert @player.movement == 0.4
    assert @player.position == 0
    assert @player.rect.x == 0
    move()
    assert @player.position == 4.0
    assert @player.rect.x == 4
  end
  def move
    10.times do
      @player.move()
    end
  end
end
