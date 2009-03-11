

class Test_Space_Object_Rotation < Test::Unit::TestCase
  def setup
    @engine = GameEngine.new()
    @player = Player.new(@engine)
  end
  def test_initial
    assert @player.rotation.angle == 0
  end
end
