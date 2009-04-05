
#library code
require"rubygems"
require"rubygame"
require"rbgooey"
require"yaml"
require"logger"
require"test/unit"

#Application code
%w{
  engine.rb
}.each{|lib| require lib}

#Game code
%w{
  lib/speed.rb
  lib/rotation.rb
  lib/movement.rb
  lib/spaceobject.rb
  lib/player.rb
  lib/enemy.rb
}.each{|lib| require lib}
include Rubygame
TTF.setup
#test code
require"test/test_setup_game_engine.rb"
require"test/test_setup_camera.rb"
require"test/test_camera_move.rb"
require"test/test_space_object_speed.rb"
require"test/test_space_object_rotation.rb"
