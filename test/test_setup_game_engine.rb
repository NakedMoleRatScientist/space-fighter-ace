
class Test_Setup_Game_Engine < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_inital
    assert @game.mapfiles.name == nil
    assert @game.mapengine == nil
  end
  def test_setup_mapfiles
    @game.setmapfile("test/blank.map")
    assert @game.mapfiles.name == "test/blank.map"
    assert @game.mapengine.class == MapEngine
    assert @game.mapengine.terrain[0].identifer == 0
    assert @game.mapengine.terrain[1].identifer == 1
    assert @game.mapengine.mapobj[0].identifer == 0
    assert @game.mapengine.mapobj[1].identifer == 1
    assert @game.mapengine.mapobj[2].identifer == 2
    assert @game.mapengine.mapobj[2].name = "data/blank.png"
    assert @game.mapengine.terrain[1].name = "data/placeholder.png"
  end
  def test_setup_images
    @game.setmapfile("test/blank.map")
    assert @game.mapengine.terrain[0].name == "data/placeholder.png"
    assert @game.mapengine.mapobj[1].name == "data/blank.png"
    @game.setimages("test/images.yml")
    assert @game.mapengine.terrain[0].name == "data/nebula1.png"
    assert @game.mapengine.mapobj[1].name == "data/wall1.png"
  end
end
