
class Test_Camera_Move < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
    @game.setchar(CharType.new(@game))
    @game.setmapfile("test/blank.map")
    @game.characters_tracker.addchar(2,300,100)
    @game.setfollow("Player")
  end
  def test_move_once_only
    assert @game.following.rect.x == 300
    @game.following.right()
    assert @game.following.rect.x == 350
    @game.compute()
    assert @game.following.rect.x == 350
    assert @game.mapengine.mapobj[0].rect.x == 0
    assert @game.camera.width == 0
    assert @game.camera.height == 0
  end
end
