
class Test_Modify_Map < Test::Unit::TestCase
  def setup
    @mapfiles = MapFiles.new()
    @mapfiles.read("data/maps/blank.map")
    @editmap = EditMap.new(@mapfiles)
  end
  def test_edit_map_get_empty
    @editmap.edit()
    assert @mapfiles.map[0] == 0
  end
  def test_edit_change_button
    @editmap.change()
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
  def test_edit_change_button_twice
    @editmap.change()
    @editmap.change()
    @editmap.edit()
    assert @mapfiles.map[0] == 2
  end
end
