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

class GameOver
	def initialize main
		@main = main
		@text = TextMode.new(@main)
		@queue = MQueue.new(self,@main,@text)
		@queue.mouse.name("cursor.png")
		ask()
	end
	def ask
		@text.clear()
		@text.add("Play Again?")
		@text.size=(70)
		@text.pos(200,200)
		@text.active()
		@text.textrender.render_text()
		@queue.queue(@text,"start")
	end
	def start activate
		case activate
			when 1
				Controller.new(@main)
		end
	end
end