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
class Controller
	def initialize main
		@main = main
		@fighter = Fighter.new
		controller()
	end
	def controller
		q = Rubygame::Queue.instance()
		x = 0
		while 1
			q.get.each do |e|
				case e
					when Rubygame::KeyDownEvent
						case e.key
							when Rubygame::K_ESCAPE
								exit
							when Rubygame::K_LEFT
							when Rubygame::K_RIGHT
							when Rubygame::K_S
						end
				end
			end			
			execute()
		end
	end
	def execute 
		@main.screen.flip()
		@fighter.draw(@main.screen)
	end
end