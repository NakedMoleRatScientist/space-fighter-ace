

class Test_Space_Object_Movement < Test::Unit::TestCase
  def setup
    @engine = GameEngine.new()
    @player = Player.new(@engine)
  end
  def test_initial
    assert @player.speed == 0
    assert @player.movement == 0
  end
end
