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
#
#You can contact the author at wikipediankiba@gmail.com

class Starter
	def initialize
		@display = Display.new
		@display.setup(800,600,true)
		@display.color([100 , 100 ,100],[20 , 20 ,20])
		@data = UiData.new(@display)
		@data.text.setup("data/freesansbold.ttf",16)
		@clock = Rubygame::Clock.new
		@clock.target_frametime= 40
		@q = Rubygame::EventQueue.new()
		@background = Rubygame::Surface.load_image("data/startscreen.jpeg")
		@background.blit(@display.screen,[0,0])
	end
	def play
		loop do
			@clock.tick
			@q.each do |ev|
				case ev
				when Rubygame::QuitEvent
					Rubygame.quit()
					return
				when Rubygame::KeyDownEvent
					case ev.key
					when Rubygame::K_ESCAPE
						Rubygame.quit()
						return
					end
				end
			end
			@display.screen.flip()
		end
	end
end
