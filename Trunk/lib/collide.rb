#Copyright (C) 2006 by Han Dao
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

#This is the game SpaceFighterAce
#You can contact the author at wikipediankiba@gmail.com
class CollideDetector
	def initialize weapon , fighter , enemy , point
		@weapon = weapon
		@fighter = fighter
		@enemy = enemy
		@point = point
	end
	def detect
		weapon = @weapon.return
		fighter = @fighter.return
		weapon.each do |rect|
			if rect.collide_rect?(fighter)
				return false
			end
		end
		enemy_detect(weapon)
	end
	def enemy_detect weapon
		collide = 0
		count = weapon.size
		enemy = @enemy.return(true)
		enemy.each do |enemy|
			if collide_detect(weapon,enemy,count)
				pop_enemy(collide)
				count = weapon.size
			end
			collide  += 1
		end
	end
	def collide_detect weapon , enemy , count
		number = 0
		while 1
			if number == count
				return false
			end
			if enemy.collide_rect?(weapon[number])
				pop_rocket(number)
				return true
			end
			number += 1
		end
	end
	def pop_enemy collide
		@enemy.pop(collide)
		@point.score()
	end
	def pop_rocket number
		@weapon.pop(number)
	end
end