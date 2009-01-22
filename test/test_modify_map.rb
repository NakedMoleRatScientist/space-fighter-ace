
class Test_Modify_Map
  def setup
    @engine = MapEngine.new()
    @engine.setchar(Chartype.new(@engine))
    @engine.setitem(ItemType.new())
    @engine.setmapsurface([800,600])
    @engine.setimages("data/images.yml")
  end
end
