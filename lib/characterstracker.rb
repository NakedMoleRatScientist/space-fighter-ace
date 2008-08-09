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


class CharactersTracker
  attr_accessor :characters , :sprites , :control
  def initialize engine
    @engine = engine
    @mapengine = @engine.mapengine
    @chartype = @engine.chartype
    @calculator = MapCalculator.new(@engine.mapengine)
    @characters = []
    @sprites = Rubygame::Sprites::Group.new()
    @control = nil
  end
  # NOTE: Generate all characters.
  def datacompute
    @calculator.rectlocation(@mapengine.mapfiles.characters) {
      addchar(@calculator.o,@calculator.x,@calculator.y)
    }
  end
  # NOTE: Collect positions to revert back to.
  def prevposition
    @characters.each do |c|
      c.retainer = [c.rect.x,c.rect.y]
    end
  end
  # NOTE: Compute actions.
  def act
    n = 0
    @characters.each do |c|
      if c.death == true
        @characters.delete_at(n)
        @sprites.delete(c)
      end
      c.act()
      n += 1
    end
  end
  # NOTE: Look up a specific character.
  def lookup name , obj = false
    n = 0
    @characters.each do |char|
      if char.name == name
        if obj == true
          return char
        else
          return n
        end
      end
      n += 1
    end
  end
  # NOTE: Print all the characters' name.
  def printall
    name = []
    @characters.each do |char|
      puts char.name
      name << char
    end
    return name
  end
  # NOTE: Clear out the characters and sprites array.
  def clean
    @characters = []
    @sprites = Rubygame::Sprites::Group.new()
  end
  # NOTE: Add a character to the mix.
  def addchar o , x , y
    char = @chartype.options(o,x,y)
    if char != false
      @characters << char
      @sprites << char
    end
  end
  # NOTE: Set the @control to the last added.
  def set_control_last
    @control = @characters.last
  end
end
