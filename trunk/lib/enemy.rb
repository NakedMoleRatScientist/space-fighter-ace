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
  attr_accessor :action , :state
  def initialize weapon
    @image = Rubygame::Surface.load_image("data/game/enemy.png")
    @rect = Rubygame::Rect.new(rand(801),0,*@image.size)
    @weapon = weapon
    @shoot = Timer.new(1) { @weapon.incoming(@rect.centerx,@rect.centery) }
    @shoot.start()
    @state = true
    newgoal()
  end
  def newgoal
    @x = rand(801)
    @y = rand(541)
  end
  def move
    if @rect.centery < @y
      @rect.centery += 10
    elsif @rect.centery > @y
      @rect.centery -= 10
    end
    if @rect.centerx < @x
      @rect.centerx += 10
    elsif @rect.centerx > @x
      @rect.centerx -= 10
    end
    if @rect.centery - @y <= 10
      if @rect.centery - @y >= -10
        @rect.centery = @y
      end
    end
    if @rect.centerx - @x <= 10
      if @rect.centerx - @x >= -10
        @rect.centerx = @x
      end
    end
    if @rect.centerx == @x && @rect.centery == @y
      newgoal()
    end
  end
  def act
    move()
    @shoot.check()
  end
end