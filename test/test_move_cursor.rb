

class Test_Move_Cursor < Test::Unit::TestCase
  def setup
    @mapfiles = MapFiles.new()
    @mapfiles.read("data/maps/blank.map")
    @editmap = EditMap.new(@mapfiles)
    @editmap.change()
  end
  def test_inital_location
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
  def test_move_right
    @editmap.move_right()
    @editmap.edit()
    assert @mapfiles.map[1] == 1
  end
end
