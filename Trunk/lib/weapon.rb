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

class Weapon
	def initialize
		@image = Rubygame::Image.load("rocket.png")
		@rect = []
		@status = []
	end
	def return
		return @rect
	end
	def generate x , y , status = false
		@rect << Rect.new(x,y,10,10)
		@status << status
	end
	def movement
		number = 0
		@rect.zip(@status).each do |pos,move|
			if move == true
				pos.centery -= 3
				if pos.centery <= 0
					pop(number)
				end
			else
				pos.centery += 3
				if pos.centery >= 600
					pop(number)
				end
			end
			number += 1
		end
	end
	def draw screen
		@rect.each do |rect|
			@image.blit(screen,[rect.centerx,rect.centery])
		end
	end
	def pop n
		@rect.delete_at(n)
		@status.delete_at(n)
	end
end