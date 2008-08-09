#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2008 Han Dao
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

class Movement
  attr_accessor :speed
  def initialize object
    @object = object
    @direction = 0
    @speed = 0
    @rotate = 0
    @rotatespeed = 0
    @angle = - Math::PI / 2
    @mode = false
    @speedup = Timer.new(1) {
      @speed += 2
    }
    @speedup.start()
  end
  def update
    orig_angle = @object.angle
    @object.angle += @angle
    movex = @speed * Math.cos(@object.angle)
    movey = @speed * Math.sin(@object.angle)
    @object.rect.centerx += movex
    @object.rect.centery += movey
    @object.angle = orig_angle
  end
  def directionmove
    case @direction
    when 1
      @angle = - Math::PI / 2
    when 2
      @angle = Math::PI / 2
    when 3
      @angle = 0
    when 4
      @angle = Math::PI
    when 0
      @speed = 0
    end
    update()
  end
  def change_brust
    if @mode == false
      @mode = true
    else
      @mode = false
    end
  end
  def increase
    @speedup.check()
  end
  def directionchange n
    if n == @direction
      return
    end
    @direction = n
    reset()
  end
  def reset
    @speed = 3
  end
end
