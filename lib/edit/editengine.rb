#Mapeditor program
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

class EditEngine < EngineInfo
  attr_accessor :editui , :editmap
  def initialize
    super()
  end
  def setup loggerui , data
    @editmap = EditMap.new(mapfiles,@images)
    @editui = EditUi.new(loggerui,data,self)
    @calculate = MapCalculator.new(@camera.width,@camera.height)
  end
  def save
    @editmap.save()
    @editui.loggerui.savemessage(@editmap.mapfiles.name)
  end
  def edit
    @editmap.edit()
    @mapengine.restart()
  end
  def draw screen
    @editui.change_choice(@editmap.return_name_of_current_selection())
    @mapengine.draw()
    @characters_tracker.sprites.draw(screen)
    @itemstrack.sprites.draw(screen)
    @mapsurface.blit(screen,[0,0])
    @editui.draw()
  end
  def compute
    @camera.compute()
  end
  def cycle
    @editmap.change()
  end
  def return_xy_pos
    x , y = @calculate.calculate_pos(@editmap.location)
    return x , y
  end
end
