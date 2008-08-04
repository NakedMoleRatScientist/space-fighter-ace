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


class ItemsTracker
  attr_accessor :items , :sprites
  def initialize engine
    @engine = engine
    @itemtype = @engine.itemtype
    @items = []
    @sprites = Rubygame::Sprites::Group.new()
    @calculator = MapCalculator.new(@engine.mapengine)
  end
  def datacompute
    @calculator.rectlocation(@engine.mapengine.mapfiles.items) {
       item = @itemtype.options(@calculator.o,@calculator.x,@calculator.y)
       if item !=false
        @items << item
        @sprites << item
       end
    }
  end
  # NOTE: Clean out the items and sprites array.
  def clean
    @items = []
    @sprites = Rubygame::Sprites::Group.new()
  end
end
