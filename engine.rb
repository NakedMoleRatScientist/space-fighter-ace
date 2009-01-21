
%w{
 lib/config/characterslaw.rb
 lib/config/itemslaw.rb
 lib/config/maplaw.rb
 lib/config/gamelaw.rb
}.each{|lib| require lib}

%w{
  lib/engine/engineinfo.rb
  lib/engine/gameengine.rb
  lib/engine/character.rb
  lib/engine/timer.rb
  lib/engine/itemstracker.rb
  lib/engine/characterstracker.rb
  lib/engine/chartype.rb 
}.each{|lib| require lib}

%w{
  lib/map/mapdata.rb
  lib/map/maptile.rb
  lib/map/camera.rb
  lib/map/mapterrain.rb
}.each{lib/require lib}
