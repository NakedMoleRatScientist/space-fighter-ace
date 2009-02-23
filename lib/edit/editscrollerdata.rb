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

class EditScrollerData
  def initialize
    @object = MapTile.new()
    @object.sets(850,100)
    @object.name = "data/delete.png"
    @object.imageload()
  end
  def load_new name
    if name == false
      @object.name = "data/delete.png"
    else
      @object.name = name
    end
    @object.imageload()
  end
  def draw screen
    @object.draw(screen)
  end
end
