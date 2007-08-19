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

#Youcan contact the author at wikipediankiba@gmail.com
class CollideDetector
  def initialize weapon , enemy , player , score
    @weapon = weapon
    @enemy = enemy
    @player = player
    @score = score
  end
  def collide
    if @player.state != false
      player()
    end
    enemy()
  end
  def player
   counte = @weapon.e.size
   if player_detect(counte)
      destory(2)
   end
  end
  def enemy
    c = 0
    @enemy.target.each do |en|
      if en.state != false
        countp = @weapon.p.size
        if enemy_detect(countp,en)
          destory(1,c)
        end
      end
      c += 1
    end
  end
  def enemy_detect count , en
    number = 0
    while 1
      if number == count
        return false
      end
      if en.rect.collide_rect?(@weapon.p[number])
        @weapon.p.delete_at(number)
	@score.hit()
        return true
      end
      number += 1
    end
  end
  def player_detect count
    number = 0
    while 1
      if number == count
        return false
      end
      if @player.rect.collide_rect?(@weapon.e[number])
        @weapon.e.delete_at(number)
        return true
      end
      number += 1
    end
  end
  def destory n , t = 0
    case n
    when 1 
      @enemy.target[t].state = false
    when 2
      @player.state = false
    end
  end
end