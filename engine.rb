
%w{
 lib/config/maplaw.rb
 lib/config/itemslaw.rb
 lib/config/characterslaw.rb
 lib/config/gamelaw.rb
 lib/config/chartype.rb
 lib/config/itemtype.rb
}.each{|lib| require lib}

%w{
  lib/map/mapimages.rb
  lib/map/mapdata.rb
  lib/map/mapfiles.rb
  lib/map/maptile.rb
  lib/map/mapcalculator.rb
  lib/map/mapterrain.rb
  lib/map/mapengine.rb
}.each{|lib| require lib}

%w{
  lib/camera_log.rb
  lib/engine/camera.rb
  lib/engine/timer.rb
  lib/engine/engineinfo.rb
  lib/engine/gameengine.rb
  lib/engine/character.rb
  lib/engine/itemstracker.rb
  lib/engine/characters_tracker.rb
}.each{|lib| require lib}

