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

class Scoreboard
	attr_accessor :points
	def initialize main , game
		@main = main
		@game = game
		@text = TextMode.new(@main)
		@queue = MQueue.new(self,@main,@text)
		@queue.mouse.name("cursor.png")
		@points = points
		setup()
	end
	def setup
		@points = 0
	end
	def score
		@points += 1
		@game.scoreboard()
	end
	def render
		@text.clear()
		@text.add("You scored #{@points.to_s}!")
		@text.add("Press this to continue!")
		@text.size=(20)
		@text.pos(200,200)
		@text.active()
		@text.textrender.render_text()
		@queue.queue(@text,"move")
	end
	def move activate
		case activate
			when 1
				GameOver.new(@main)
		end
	end
end