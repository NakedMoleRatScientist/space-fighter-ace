#YourGameHere
#Copyright (C) 2008 YourNameHere

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


class GameEngine < EngineInfo
  attr_accessor :law
  def initialize
    super()
  end
  # NOTE: Set general game logic and laws.
  # Set this after setup()
  def ruleset law
    @law = law
  end
  # NOTE: Compute everything.
  def compute
    if @characters_tracker != nil
      @characters_tracker.act()
    end
    if @law != nil
      @law.compute()
    end
    @camera.compute()
  end
  # NOTE: Draw everything
  def draw screen
    @mapengine.draw()
    @characters_tracker.draw(@mapsurface)
    @itemstracker.sprites.draw(@mapsurface)
    @mapsurface.blit(screen,[0,0])
  end
  # NOTE: Retrive all previous positions of characters.
  def prevposition
    @characters_tracker.prevposition()
  end
  # NOTE: Draw the map background
  def undraw screen
    @mapengine.undraw(screen)
  end
end
