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

#This is a benchmark test.
class Altcontroller
	def initialize main
		@main = main
		@warrior = Fighter.new
		@weapon = Weapon.new
		@target = Enemy.new
		@point = Scoreboard.new(@main,self)
		@delete = CollideDetector.new(@weapon,@warrior,@target, @point)
		@text = TextMode.new(@main)
		@text.add("0")
		@text.render.render_text(true)
		controller()
	end
	def controller
		q = Rubygame::Queue.instance()
		x = 0
		y = 0
		while 1
			if y == 100
				return
			end
			q.get.each do |e|
				case e
					when Rubygame::KeyDownEvent
						case e.key
							when Rubygame::K_ESCAPE
								return
							when Rubygame::K_LEFT
								x = -3
							when Rubygame::K_RIGHT
								x = 3
							when Rubygame::K_S
								x = 0
							when Rubygame::K_SPACE
								@weapon.generate(@warrior.x,@warrior.y,true)
						end
				end
			end
			y+=1
			execute(x)
		end
	end
	def execute x
		@main.screen.flip()
		@main.screen_clear()
		@warrior.pos(x)
		@warrior.draw(@main.screen)
		@weapon.movement()
		@weapon.draw(@main.screen)
		enemy()
		determine = @delete.detect()
		if determine == false
			@main.background_cleanup(800,600)
			@point.gameover()
			exit
		end
	end
	def enemy
		if rand(51) == 0
			@target.generate(rand(801))
		end
		if rand(21) == 0
			x , y = @target.return
			if Integer === x
				@weapon.generate(x,y)
			end
		end
		@target.draw(@main.screen)
		@target.movement()
	end
	def scoreboard
		@text.text[0] = @point.points.to_s
		@text.render.render_text(true)
	end
end