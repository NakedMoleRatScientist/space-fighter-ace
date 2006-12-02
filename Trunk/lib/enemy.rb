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

class Enemy
	def initialize
		@image = Rubygame::Image.load("enemy.png")
		@rect = []
		@movement = 0
	end
	def return info = false
		if info == true
			return @rect
		else
			if @rect.size != 0
				number = rand(@rect.size)
				y = @rect[number].centery
				return @rect[number].centerx , y+=50
			end
		end
	end
	def generate x 
		@rect << Rect.new(x,0,50,50)
	end
	def movement
		number = 0
		@rect.each do |pos|
			pos.centerx += rand(4)
			pos.centerx -= rand(4)
			pos.centery += rand(4)
			if pos.centery >= 600
				pop(number)
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
	end
end