#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2008  Han Dao
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

class Projectile < SpaceObject
  ENEMY_PATH = "data/game/enemytracer.png"
  PLAYER_PATH = "data/game/playertracer.png"
  def initialize engine
    super(ENEMY_PATH,engine)
    @state = true
    @timer = Timer.new(10) {
      death_switch()
    }
    @timer.start()
  end
  def sets x , y
    super(x,y)
    image_set()
  end
  def image_set
    if @state == true
      @image = Rubygame::Surface.load(ENEMY_PATH)
    elsif @state == false
      @image = Rubygame::Surface.load(PLAYER_PATH)
    end
  end
  def act
    super
    @timer.check()
  end
end
