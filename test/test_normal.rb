

class Test_Normal < Test::Unit::TestCase
  def setup
    @mapfiles = MapFiles.new()
    @mapfiles.read("data/maps/blank.map")
    files = FileSys.new()
    @images = files.yaml_read("data/images.yml")
    @editmap = EditMap.new(@mapfiles,@images)
  end
  def test_initial
    @editmap.change()
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
  def test_end_of_list
    change(7)
    @editmap.edit()
    assert @mapfiles.map[0] == 0
    assert @mapfiles.characters[0] == 0
    assert @mapfiles.items[0] == 0
  end
  def change num
    num.times do
      @editmap.change()
    end
  end
end
