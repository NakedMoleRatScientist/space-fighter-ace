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
		@points = points
		@stat = StatFileGenerator.new
		setup()
	end
	def setup
		@points = 0
	end
	def score
		@points += 1
		@game.scoreboard()
	end
	def compare
		score = 0
		@stat.stat.each do |previous|
			if @points > previous[1]
				return score
			end
			score += 1
		end
		return false
	end
	def gameover
		change = compare()
		if Integer === change
			@stat.stat[change][1] = @points
			n = change + 1
			@text.clear()
			@text.add("You broke record with #{points.to_s}! The ranking you beat is #{n.to_s}.")
			@text.add("Time to name the player! After the naming process, we take you to the scoreboard.")
			@text.add("Please type your name.")
			@text.render.render_text()
			input = @text.input.input()
			@stat.stat[change][0] = input
			@stat.save()
			scoreboard()
		else
			@text.clear()
			@text.add("You scored #{@points.to_s}. However you failed to make the highscore.")
			@text.add("To continue to the scoreboard, type anything and enter in the keyboard.")
			@text.render.render_text()
			@text.input.input()
			scoreboard()
		end
	end
	def scoreboard
		@text.clear()
		@text.add("Current ranking!")
		n = 1
		@stat.stat.each do |stat|
			@text.add("#{n.to_s}. #{stat[0]} , #{stat[1].to_s}")
			n +=1
		end
		@text.add("type anything and enter the keyboard to continue to the post game menu.")
		@text.render.render_text()
		@text.input.input()
		GameOver.new(@main)
	end
end