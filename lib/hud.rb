#YourGameHere
#Copyright (C) 2008 YourNameHerea

#Kiba Role Playing Game Engine(KRPGE)
#Copyright (C) 2008 Han Dao and contributors
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

#You can contact the author at wikipediankiba@gmail.com

class Hud
  def initialize data , engine
    @data = data
    @engine = engine
    @clock = Rubygame::Clock.new
    @clock.target_framerate = 30
  end
  def text
    @clock.tick()
    @data.clear()
    @data.declare(:Info)
    @data.text.add("Speed: #{@engine.following.movement.speed}",800,0)
    @data.text.add("Angle: #{@engine.following.angle}",800,0)
    @data.text.add("FPS: #{@clock.framerate()}",800,0)
  end
end
