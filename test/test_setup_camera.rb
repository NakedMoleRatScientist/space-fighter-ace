
class Test_Map_Camera < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_initial
    assert @game.camera.class == Camera
    test = @game.compute()
    assert test == false
  end
end
