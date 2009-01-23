
class Test_Modify_Map < Test::Unit::TestCase
  def setup
    @engine = EditEngine.new()
    @engine.setchar(CharType.new(@engine))
    @engine.setitem(ItemType.new())
    @engine.setimages("data/images.yml")
  end
  def test_edit_map_get_empty
    @engine.edit()
    state = true
    @engine.mapfiles.map.each do |map|
      if map != 0
	state = false
      end
    end
    assert state == true
  end
end
