
class Test_Modify_Map
  def setup
    @engine = EditEngine.new()
    @engine.setchar(Chartype.new(@engine))
    @engine.setitem(ItemType.new())
    @engine.setmapsurface([800,600])
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
