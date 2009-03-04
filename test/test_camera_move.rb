
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
    no_movement()
  end
  def test_move_once_only_do_twice
    @game.following.right()
    @game.compute()
    @game.compute()
    no_movement()
  end
  def no_movement
    assert @game.following.rect.x == 350
    assert @game.mapengine.mapobj[0].rect.x == 0
    assert @game.camera.width == 0
    assert @game.camera.height == 0
  end
  def test_camera_move
    @game.following.right()
    assert @game.following.rect.x == 350
    @game.following.right()
    assert @game.following.rect.x == 400
    @game.compute()
    assert @game.following.rect.x == 350
    assert @game.camera.width == -50
    assert @game.camera.height == 0
  end
end
