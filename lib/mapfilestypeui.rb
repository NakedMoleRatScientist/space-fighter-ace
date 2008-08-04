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

class MapFilesTypeUi
  def initialize menu
    @menu = menu
    @data = @menu.data
  end
  def text
    @data.declare(:input)
    @data.type.position(0,750)
  end
  def inputmatch
    if @data.type.state == false
      string = @data.string.last
      if invalidateinput(string)
        return
      end
      string = string.to_i
      confirmresult(string)
    end
  end
  #Throw out any input that can't be used
  def invalidateinput string
    begin 
    test = Integer(string)
    rescue ArgumentError
      @menu.logger.typefail()
      return true
    end
    return false
  end
  def confirmresult value
    if @menu.size >= value && value > 0
      @menu.file = value - 1
      @menu.logger.typeload()
      @menu.editmodeactive()
    else
      @menu.logger.matcherror()
    end
  end
end
