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

class LoggerUi
  def initialize data
    @data = data
    @string = []
  end
  def overflow
    if @string.size > 5
      @string.delete_at(0)
    end
  end
  def text
    overflow()
    @data.declare(:log)
    x = 0
    y = 610
    @string.each do |text|
      @data.text.add(text,x,y)
      y += 25
    end
  end
  def intro
    @string << "Welcome to the map editor program."
  end
  # NOTE: error message for incorrect input
  def typefail
    @string << "Error: Input does not match any available values. Try again with usable input."
  end
  # NOTE: Successful maploading
  def typeload
    @string << "Operation succeeded. The file in question is loaded."
  end
  # NOTE: When integer does not match the range, signal error message.
  def matcherror
    @string << "Value is out of range. No such file numbered by that value"
  end
  # NOTE: Notify the user that the map is saved. This time, it required an argument in order to work.
  def savemessage filename
    @string << "This file #{filename} is written to disk."
  end
  # NOTE: EditCursor's mode change to delete.
  def deletemode
    @string << "The EditCursor's mode has been changed to delete."
  end
  # NOTE: EditCurosr's mode change to stamp.
  def stampmode
    @string << "The EditCursor's mode has been changed to stamp."
  end
end
