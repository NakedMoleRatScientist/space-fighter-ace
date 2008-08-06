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
  def initialize fighter
    @fighter = fighter
    @direction = 0
    @speed = 3
    @rotate = 0
    @rotatespeed = 0
    @x = 0
    @y = 0
    @mode = false
    @speedup = Timer.new(2) {
      @speed += 1
    }
    @speedup.start()
  end
  def update
    @fighter.rect.centerx += @x
    @fighter.rect.centery += @y
  end
  def directionmove
    case @direction
    when 1
      @y = - @speed
    when 2
      @y = @speed
    when 3
      @x = @speed
      ybrust()
    when 4
      @x = - @speed
      ybrust()
    when 0
      @x = 0
      @y = 0
    end
    update()
  end
  def ybrust
    if @mode == true
      @y = 0
    end
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
    @direction = n
  end
  def reset
    @speed = 3
  end
end
