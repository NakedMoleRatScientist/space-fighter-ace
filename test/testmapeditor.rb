

#library code
require"rubygems"
require"rubygame"
require"rbgooey"
require"yaml"
require"test/unit"

#Application code
%w{
  maplib.rb
}.each{|lib| require lib}

include Rubygame
TTF.setup
#Test code
require"test/test_modify_map.rb"
require"test/test_move_cursor.rb"
require"test/test_normal.rb"
require"test/test_alternative_images.rb"
require"test/test_alternative_images_2.rb"
require"test/test_alternative_images_3.rb"