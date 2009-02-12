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

class EditMap
  def initialize mapfiles
    @mapfiles = mapfiles
    @n = 0
    @state = 0
    @location = 0
  end
  def move_by n
    if @location + n > 0 && @location + n < 900
      @location += n
    end
  end
  def save
    @mapfiles.save()
  end
  def move_left
    move_by(-1)
  end
  def move_right
    move_by(1)
  end
  def move_down
    move_by(30)
  end
  def move_up
    move_by(-30)
  end
  def change
    @n += 1
    if @state == 0
      if @n == 3
	@state += 1
	@n = 1
      end
    elsif @state == 1
      if @n == 3
	@state += 1
	@n = 1
      end
    elsif @state == 2
       if @n == 3
        @state = 0
        @n = 0
       end
    end
  end
  def edit
    if @state == 0
      @mapfiles.map[@location] = @n
    elsif @state == 1
      @mapfiles.characters[@location] = @n
    elsif @state == 2
      @mapfiles.items[@location] = @n
    end
  end
end
