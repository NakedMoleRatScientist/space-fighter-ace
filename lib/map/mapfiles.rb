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


class MapFiles
  attr_accessor :list , :map , :items , :characters , :name , :terrain
  def initialize
    @map = Array.new(30*30,0)
    @items = Array.new(30*30,0)
    @characters = Array.new(30*30,0)
    @terrain = Array.new(3*3,0)
    @name = nil
  end
  #Choose the directory location for maps
  def directory dir
    @dir = dir
  end
  #Return an array that have all the maps listed in that particular directory
  def fileslist
    list =  Pathname(@dir)
    list = list.children
    @list = list
    return list
  end
  def read name
    yaml_string = File.read(name) 
    data = YAML::load(yaml_string)
    @name = name
    @map, @items, @characters , @terrain = data.values_at(:map, :items, :characters, :terrain)
  end
  def write object , name
    File.open name , 'w' do |f|
     f.write(object.to_yaml)
    end
  end
  def create name
    data = {:map => @map, :characters => @characters, :items => @items, :terrain => @terrain}
    write(data,name)
  end
  def choose n
    read(@list[n])
  end
  # NOTE: Write to file using the name you loaded.
  def save
    create(@name)
  end
end
