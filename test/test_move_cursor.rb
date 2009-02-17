

class Test_Move_Cursor < Test::Unit::TestCase
  def setup
    @mapfiles = MapFiles.new()
    @mapfiles.read("data/maps/blank.map")
    files = FileSys.new()
    @images = files.yaml_read("data/images.yml")
    @editmap = EditMap.new(@mapfiles,@images)
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
  def test_move_down
    @editmap.move_down()
    @editmap.edit()
    assert @mapfiles.map[30] == 1
  end
  def test_attempt_to_move_up
    @editmap.move_up()
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
  def test_move_left_attempt
    @editmap.move_left()
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
  def test_move_right_right_left
    @editmap.move_right()
    @editmap.move_right()
    @editmap.move_left()
    @editmap.edit()
    assert @mapfiles.map[1] == 1
  end
  def test_move_down_down_up
    @editmap.move_down()
    @editmap.move_down()
    @editmap.move_up()
    @editmap.edit()
    assert @mapfiles.map[30] == 1
  end
  def test_move_right_past_limit
    901.times do
      @editmap.move_right()
    end
    @editmap.edit()
    assert @mapfiles.map[899] == 1
  end
end
