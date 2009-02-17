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

class EditCursor
  include Rubygame::Sprites::Sprite
  attr_accessor :rect , :loggerui , :state
  STAMP = "data/stamp.png"
  DELETE = "data/delete.png"
  def initialize loggerui
    super()
    @loggerui = loggerui
    @image = Rubygame::Surface.load(STAMP)
    @rect = Rubygame::Rect.new(0,0,80,60)
    @state = false
  end
  def change
    if @state == false
      @state = true
      @loggerui.deletemode()
    else
      @state = false
      @loggerui.stampmode()
    end
    imageload()
  end
  def imageload
    if @state == false
      @image = Rubygame::Surface.load(STAMP)
    elsif @state == true
      @image = Rubygame::Surface.load(DELETE)
    end
  end
  def set_xy x , y
    @rect.x = x
    @rect.y = y
  end
end
