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

class Player < SpaceObject
  IMAGE_PATH = "data/game/player.png"
  def initialize engine
    super(IMAGE_PATH,engine)
  end
  def act
    super
  end
  def shoot
    @engine.charstrack.addchar(3,@rect.x,@rect.y - 25)
    @engine.charstrack.set_control()
    @engine.charstrack.control.state = false
    @engine.charstrack.control.image_set()
    @engine.charstrack.control.movement.directionchange(1)
  end
end
