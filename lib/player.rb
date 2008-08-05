#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2007  Han Dao
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
#
#You can contact the author at wikipediankiba@gmail.com

class Player < Character
  attr_accessor :speed , :direction
  IMAGE_PATH = "data/game/player.png"
  def initialize engine
    super(IMAGE_PATH,engine)
    @orig_image = Surface.load(IMAGE_PATH)
    @speed = 3
    @direction = 0
    @rotate = 10
    @x = 0
    @y = 0
    @speedup = Timer.new(2) {
      @speed += 1
    }
    @speedup.start()
  end
  def pos
    @rect.centerx += @x
    @rect.centery += @y
  end
  def act
    case @direction
    when 1
      @x = 0
      @y = - @speed
    when 2
      @x = 0
      @y = @speed
    when 3
      @x = @speed
      @y = 0
    when 4
      @x = - @speed
      @y = 0
    end
    pos()
  end
  def change
    @speed = 3
  end
  def increase
    @speedup.check()
  end
  def rotation
    if @rotate == 0
      return
    end
    @image = @orig_image
    rotate += @rotate
    @image = @image.rotozoom(rotate,[1,1],true)
  end
end
