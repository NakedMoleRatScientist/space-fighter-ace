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

class Weapon
  def initialize
    @play = Rubygame::Surface.load_image("data/game/rocket.png")
    @enem = Rubygame::Surface.load_image("data/game/badrocket.png")
    @p = []
    @e = []
  end
  def fire x
    if @p.size != 10
      @p << Rect.new(x,550,5,15)
    end
  end
  def pmove
    number = 0
    @p.each do |pos|
      pos.centery -= 9
      if pos.centery <= 0
	@p.delete_at(number)
      end
      number += 1
    end
  end
  def draw screen
    pmove()
    @p.each do |rect|
      @play.blit(screen,[rect.centerx,rect.centery])
    end
  end
end