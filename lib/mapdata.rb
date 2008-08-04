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



class MapData
  def initialize engine
    @engine = engine
    @adapter = @engine.adapter
    @calculator = MapCalculator.new(@engine)
  end
  # NOTE: It use an image yaml file, which list the integer correspondance to image names. It used the integers from the mapobj's map array, which is m to determine what images to load.
  def datacompute
    n = 0
    @calculator.rectlocation(@engine.mapfiles.map) {
      image = Rubygame::Surface.load(@engine.engine.images['map'][@calculator.o])
	    obj = MapTile.new()
	    obj.imageload(image)
	    obj.sets(@calculator.x,@calculator.y)
      case @calculator.o
	    when 0
        obj.property = false
	    when 7
        obj.property = 3
	    end
	    @engine.mapobj << obj
	    n = n + 1
    }
  end
  def terraincompute
    @calculator.defaultx = 800
    @calculator.defaulty = 600
    @calculator.defaultcolumns = 3
    @calculator.defaultrows = 3
    @calculator.rectlocation(@engine.mapfiles.terrain) {
      image = Rubygame::Surface.load(@engine.engine.images['terrain'][@calculator.o])
      obj = MapTerrain.new()
      obj.imageload(image)
      obj.sets(@calculator.x,@calculator.y)
      @engine.terrain << obj
      @engine.terrainsprites << obj
    }
  end
end
