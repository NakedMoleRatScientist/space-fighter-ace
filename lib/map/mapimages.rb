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


class MapImages
  def initialize map , terrain
    @map = map
    @terrain = terrain
  end
  def load_all_images images
    @terrain.each do |terrain|
      terrain.name = images["terrain"][terrain.identifer]
      terrain.set_terrain()
    end
    map_task()
  end
  def map_task
    @map.each do |map|
      map.name = image["map"][map.identifer]
      map.imageload()
    end
  end
end
