

class Test_Move_Cursor < Test::Unit::TestCase
  def setup
    @mapfiles = MapFiles.new()
    @mapfiles.read("data/maps/blank.map")
    @editmap = EditMap.new(@mapfiles)
  end
  def test_inital_location
    @editmap.edit()
    assert @mapfiles.map[0] == 0
  end
end
