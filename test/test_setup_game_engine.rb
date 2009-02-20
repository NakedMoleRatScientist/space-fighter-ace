
class Test_Setup_Game_Engine < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_inital
    assert @game.mapfiles.name == nil
  end
  def test_setup_mapfiles
    @game.setmapfile("data/maps/blank.map")
    assert @game.mapfiles.name == "data/maps/blank.map"
  end
end
