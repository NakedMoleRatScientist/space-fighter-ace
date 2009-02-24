
class Test_Map_Camera < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
    @game.setmapfile("test/blank.map")
  end
  def test_initial
    assert @game.mapengine.camera.class == Camera
  end
end
