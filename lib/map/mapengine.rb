#YourGameHere
#Copyright (C) 2008 YourNameHere

#Kiba Role Playing Game Engine(KRPGE)
#Copyright (C) 2008-2009 Han Dao and contributors
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


class MapEngine
  attr_accessor :mapobj , :camera , :length , :height , :mapfiles , :background , :engine , :mapdata , :terrain , :terrainsprites
  def initialize engine
    @engine = engine
    @mapsurface = engine.mapsurface
    @mapfiles = engine.mapfiles
    @mapobj  = []
    @length  = 0
    @height  = 0
    @terrain = []
    @terrainsprites = Rubygame::Sprites::Group.new()
    @mapimages = MapImages.new(@engine.images,@mapobj, @terrain)
  end
  # NOTE: Setup everything
  def setup
    @mapdata = MapData.new(self)
    @mapdata.datacompute()
    @mapdata.terraincompute()
  end
  #NOTE: Setup camera
  def cam
    @camera = Camera.new(self)
  end
  # NOTE: Compute Everything
  def compute
    @camera.compute()
  end
  # NOTE: Draw the terrain and then the map.
  def draw
    @mapobj.each do |map|
      map.draw(@mapsurface)
    end
    @terrain.each do |terrain|
      terrain.draw(@mapsurface)
    end
  end 
  # NOTE: Clean out the mapobj array.
  def clean
    @mapobj = []
  end
end
