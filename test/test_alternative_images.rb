class Test_Alternative_Images < Test::Unit::TestCase
  def setup
    @mapfiles = MapFiles.new()
    @mapfiles.read("data/maps/blank.map")
    files = FileSys.new()
    @images = files.yaml_read("test/images.yml")
    @editmap = EditMap.new(@mapfiles,@images)
  end
  def test_initial
    @editmap.change()
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
  def test_character_end
    change(5)
    @editmap.edit()
    assert @mapfiles.map[0] == 0
    assert @mapfiles.characters[0] == 3
    assert @mapfiles.items[0] == 0
  end
  def test_items
   change(6)
   @editmap.edit()
   assert @mapfiles.items[0] == 1
   change(1)
   @editmap.edit()
   assert @mapfiles.items[0] == 2
   change(1)
   @editmap.edit()
   assert @mapfiles.items[0] == 0
  end
  def change num
    num.times do
      @editmap.change()
    end
  end
end
