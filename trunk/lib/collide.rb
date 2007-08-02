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
  def initialize weapon , enemy
    @weapon = weapon
    @enemy = enemy
  end
  def collide
    enemy()
  end
  def enemy
    count = @weapon.p.size
    if collide_detect(count)
      destory()
    end
  end
  def collide_detect count
    number = 0
    while 1
      if number == count
        return false
      end
      if @enemy.rect.collide_rect?(@weapon.p[number])
        @weapon.p.delete_at(number)
        return true
      end
      number += 1
    end
  end
  def destory
    @enemy.state = false
  end
end