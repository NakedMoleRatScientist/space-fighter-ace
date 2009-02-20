
class Test_Setup_Game_Engine < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_inital
    assert @game.mapfiles.name == nil
  end
end
