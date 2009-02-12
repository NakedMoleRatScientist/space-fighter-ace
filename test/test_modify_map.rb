
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
    change(1)
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
  def test_edit_change_button_twice
    change(2)
    @editmap.edit()
    assert @mapfiles.map[0] == 2
  end
  def test_edit_change_type
    change(3)
    @editmap.edit()
    assert @mapfiles.characters[0] == 1
  end
  def test_edit_change_character 
    change(4)
    @editmap.edit()
    assert @mapfiles.characters[0] == 2
  end
  def test_edit_change_to_items
    change(5)
    @editmap.edit()
    assert @mapfiles.items[0] == 1
  end
  def test_edit_change_change_items
    change(6)
    @editmap.edit()
    assert @mapfiles.items[0] == 2
  end
  def test_edit_change_delete
    change(1)
    @editmap.edit()
    assert @mapfiles.map[0] == 1
    change(2)
    @editmap.edit()
    assert @mapfiles.characters[0] == 1
    change(2)
    @editmap.edit()
    assert @mapfiles.items[0] == 1
    change(4)
    @editmap.edit()
    assert @mapfiles.map[0] == 0
    assert @mapfiles.characters[0] == 0
    assert @mapfiles.items[0] == 0
  end
  def change t
    t.times do
      @editmap.change()
    end
  end
end
