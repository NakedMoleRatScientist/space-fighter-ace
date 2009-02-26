
class Test_Map_Camera < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_initial
    assert @game.camera.class == Camera
    test = @game.compute()
    assert test == false
  end
  def test_setup_following_activate
    @game.setchar(CharType.new(@game))
    @game.characters_tracker.addchar(2,100,100)
    @game.setfollow("Player")
    assert @game.camera.following.class == Player
    test = @game.camera.compute()
    assert test == true
  end
  def test_will_not_activate_without_following_even_if_everything_else_is_set
    @game.setmapfile("test/blank.map")
    test = @game.camera.compute()
    assert test == false
  end
  def test_which_is_computable?
    assert @game.camera.characters == nil
    @game.setchar(CharType.new(@game))
    assert @game.camera.characters.class == Characters_Tracker
  end
end
