

#library code
require"rubygems"
require"rubygame"
require"rbgooey"
require"yaml"
require"test/unit"

#Application code
%w{
  mapeditor.rb
}.each{|lib| require lib}

#Test code
require"test/test_modify_map.rb"
