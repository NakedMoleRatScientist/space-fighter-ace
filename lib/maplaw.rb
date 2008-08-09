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

class MapLaw
  # NOTE: All these nested ifs should go away
  def initialize engine
    @engine = engine
    @m = @engine.mapengine.mapobj
    @c = @engine.charstrack.characters
    @charstrack = @engine.charstrack
    @items = @engine.itemstrack.items
    @itemtrack = @engine.itemstrack
  end
  # NOTE:Check if map collide with the object in question.
  def mapcollide t
    @m.each do |m|
	    if m.property == true
        if m.rect.collide_rect?(t)
          return 1
        end
	    end
    end
    return 2
  end
  def maprevert t
    s = mapcollide(t)
    if s == 1
	    change(t)
    end
    return t
  end
end
