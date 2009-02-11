

class Test_Changer < Test::Unit::TestCase
  def setup
    @mapfiles = MapFiles.new()
    @mapfiles.read("data/maps/blank.map")
    @editmap = EditMap.new(@mapfiles)
  end
  def test_initial
    @editmap.change()
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
end
