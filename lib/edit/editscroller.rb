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
  attr_accessor :object , :n , :state
  def initialize engine
    @engine = engine
    @images = @engine.images
    @object = MapTile.new()
    @object.sets(850,100)
    image = Surface.load("data/nothing.png")
    @object.imageload(image)
    @characters = []
    @items = []
    @n = 0
    @state = false
  end
  def extract
    charextract()
    itemextract()
  end
  def charextract
    n = 1
    char = CharType.new(@engine)
    loop do
      check = char.options(n,0,0)
      if check == false
        break
      end
      @characters << check
      n += 1
    end
  end
  def itemextract
    n = 1
    item = ItemType.new()
    loop do
      check = item.options(n,0,0)
      if check == false
        break
      end
      @items << check
      n += 1
    end
  end
  def cycle
    if @state == false
      @state = 0
    end
    if @state == 0
      loadmap()
    end
    if @state == 1
      loadchar()
    end
    if @state == 2
      loaditem()
    end
    if @state == 3
      nothing()
      @state = false 
    end
  end
  def loadmap
    n = @n + 1
    if @images['map'][n] == nil
      reset()
      return
    end
    image = Surface.load(@images['map'][n])
    @n += 1
    @object.imageload(image)
  end
  def loadchar
    if @characters[@n] == nil
      reset()
      return
    end
    @object.imageload(@characters[@n].image)
    @n += 1
  end
  def loaditem
    if @items[@n] == nil
      reset()
      return
    end
    @object.imageload(@items[@n].image)
    @n += 1
  end
  def nothing
    image = Surface.load("data/nothing.png")
    @object.imageload(image)
  end
  def reset
    @n = 0
    @state += 1
  end
end
