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

class EditUi
  attr_accessor :data , :engine , :typeui , :loggerui , :scrollerui
  def initialize loggerui , data , engine
    @engine = engine
    @data = data
    @loggerui = loggerui
    @typeui = EditModeTypeUi.new(self)
    @info = EditInfoUi.new(@data)
    @scrollerui = EditScrollerUi.new(@engine.images,@data)
  end
  def draw
    @data.clear()
    @typeui.text()
    @info.text()
    @scrollerui.text()
    @loggerui.text()
  end
  def change_choice name
    @scrollerui.scroll_data.load_new(name)
  end
  def cycle
    @scrollerui.scrollerdata.cycle()
  end
end
