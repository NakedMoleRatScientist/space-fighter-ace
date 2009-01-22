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
  engine.rb
}.each{|lib| require lib}

%w{
  lib/itemexample.rb
  lib/itemexample2.rb
  lib/spaceobject.rb
  lib/projectile.rb
  lib/rotation.rb
  lib/movement.rb
  lib/player.rb
  lib/enemy.rb
}.each{|lib| require lib}

%w{
  lib/edit/editcursor.rb
  lib/edit/editinfoui.rb
  lib/edit/editmodetypeui.rb
  lib/edit/editscrollerui.rb
  lib/edit/filesscrollerui.rb
  lib/edit/mapfilesmenu.rb
  lib/edit/mapfilestypeui.rb
  lib/edit/editmap.rb
  lib/edit/editengine.rb
  lib/edit/editscroller.rb
  lib/edit/editui.rb
  lib/edit/loggerui.rb
  lib/edit/editmode.rb
  lib/edit/mapfilesmenuui.rb
}.each{|lib| require lib}
include Rubygame
TTF.setup

menu = MapFilesMenu.new()
menu.menu()
