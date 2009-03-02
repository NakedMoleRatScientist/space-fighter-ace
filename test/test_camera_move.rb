
class Test_Camera_Move < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
    @game.setchar(CharType.new(@game))
    @game.characters_tracker.addchar(2,100,100)
    @game.setfollow("Player")
  end
  def test_move_once_only
    @game.following.rect.x = 100
    @game.following.right()
    assert @game.following.rect.x == 100
  end
end
