#YourGameHere
#Copyright (C) 2008 YourNameHere

#Kiba Role Playing Game Engine(KRPGE)
#Copyright (C) 2008 Han Dao and contributors
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

#You can contact the author at wikipediankiba@gmail.com

%w{
  rubygems
  rubygame
  rbgooey
  yaml
  lib/engineinfo.rb
  lib/mapengine.rb
  lib/gameengine.rb
  lib/mapcalculator.rb
  lib/mapfiles.rb
  lib/character.rb
  lib/setup.rb
  lib/controller.rb
  lib/mapdata.rb
  lib/maptile.rb
  lib/camera.rb
  lib/timer.rb
  lib/maplaw.rb
  lib/itemslaw.rb
  lib/characterslaw.rb
  lib/itemstracker.rb
  lib/itemexample.rb
  lib/gamelaw.rb
  lib/characterstracker.rb
  lib/chartype.rb
  lib/itemtype.rb
  lib/charexample.rb
  lib/charexample2.rb
  lib/mapterrain.rb
  lib/player.rb
}.each{|lib| require lib}
include Rubygame
TTF.setup

game = GameSetup.new()
game.ui()
game.start()
