
class Test_Map_Camera < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_initial
    assert @game.camera.class == Camera
    test = @game.compute()
    assert test == false
  end
  def test_which_is_computable?
    assert @game.camera.characters.class == nil
    @game.setchar(CharType.new(@game))
    assert @game.camera.characters.class == Character_Trackers
	
  end
end
