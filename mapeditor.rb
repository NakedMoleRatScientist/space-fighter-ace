#Mapeditor program
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
  pathname
  lib/engineinfo.rb
  lib/timer.rb
  lib/mapfiles.rb
  lib/mapfilesmenu.rb
  lib/mapfilesmenuui.rb
  lib/filesscrollerui.rb
  lib/loggerui.rb
  lib/mapfilestypeui.rb
  lib/editmode.rb
  lib/mapengine.rb
  lib/mapdata.rb
  lib/maptile.rb
  lib/mapcalculator.rb
  lib/editcursor.rb
  lib/camera.rb
  lib/itemexample.rb
  lib/itemexample2.rb
  lib/itemtype.rb
  lib/itemstracker.rb
  lib/chartype.rb
  lib/character.rb
  lib/spaceobject.rb
  lib/characterstracker.rb
  lib/editengine.rb
  lib/editui.rb
  lib/editmodetypeui.rb
  lib/editinfoui.rb
  lib/editmap.rb
  lib/editscrollerui.rb
  lib/editscrollerdata.rb
  lib/mapterrain.rb
  lib/player.rb
  lib/enemy.rb
  lib/projectile.rb
  lib/movement.rb
  lib/rotation.rb
}.each{|lib| require lib}
include Rubygame
TTF.setup

menu = MapFilesMenu.new()
menu.menu()
