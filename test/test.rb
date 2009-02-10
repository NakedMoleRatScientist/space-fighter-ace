

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
