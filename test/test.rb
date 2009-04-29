
#library code
require"rubygems"
require"rubygame"
require"rbgooey"
require"yaml"
require"logger"
require"test/unit"
require"shoulda"

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
%w{
  test_setup_game_engine.rb
  test_setup_camera.rb
  test_camera_move.rb
}.each{|test| require "test/" + test}
