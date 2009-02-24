
#library code
require"rubygems"
require"rubygame"
require"rbgooey"
require"yaml"
require"test/unit"

#Application code
%w{
  engine.rb
}.each{|lib| require lib}

include Rubygame
TTF.setup
#test code
require"test/test_setup_game_engine.rb"
require"test/test_map_camera.rb"
