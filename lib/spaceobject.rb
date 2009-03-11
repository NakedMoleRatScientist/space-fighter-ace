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

class SpaceObject < Character
  attr_reader :speed , :movement , :position
  def initialize image, engine
    super(image,engine)
    @speed = 0
    @movement = 0
    @position = 0.0
    @addup = 0.0
    @predicted_position = 0
    @times = 0
    @timer = Timer.new(0.1) {
      move()
    } 
    @timer.start()
  end
  def act
    @timer.check()
  end
  def move
    if @times == 0
      @predicted_position = @rect.x + @speed
    end
    @position += @movement
    @addup += @movement
    @times += 1
    if @addup >= 1
      @addup = 0.0
      @rect.x += 1
    end
    if @times == 10
      @rect.x = @predicted_position
      @times = 0
    end
  end
  def set_velocity n
    @speed = n
    @movement = @speed / 10.0
  end
end
