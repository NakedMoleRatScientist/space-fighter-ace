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


class Enemy
  include Rubygame::Sprites::Sprite
  attr_accessor :action
  def initialize weapon
    @image = Rubygame::Surface.load_image("data/game/enemy.png")
    @rect = Rubygame::Rect.new(350,0,*@image.size)
    @weapon = weapon
    newgoal()
  end
  def newgoal
    @x = rand(801)
    target = @rect.centery + rand(601)
    loop do
      if target > 600
        target -= rand(51)
      end
      if target < @rect.centery
        targete += rand(51)
      end
      if target < 600 && target > @rect.centery
         @y = target
	 return
      end
    end
  end
  def move
    if @rect.centery < @y
      @rect.centery += 5
    elsif @rect.centery > @y
      @rect.centery -= 1
    end
    if @rect.centerx < @x
      @rect.centerx += 5
    elsif @rect.centery > @y
      @rect.centery -= 1
    end
  end
  def act
    move()
  end
end