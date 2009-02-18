#Mapeditor program
#Copyright (C) 2008-2009 Han Dao and contributors
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

class Image_Changer
  attr_reader :n , :state
  def initialize images
    @images = images
    @n = 0
    @state = 3
    compute_limit()
  end
  def compute_limit
    @char = @images['character'].length()
    @item = @images['item'].length()
    @map = @images['map'].length()
  end
  def change
    @n += 1
    if @state == 0
      if @n == @map
	@state += 1
	@n = 1
      end
    elsif @state == 1
      if @n == (@char + 1)
        @state += 1
	@n = 1
      end
    elsif @state == 2
      if @n == (@item + 1)
        @state = 3
	@n = 0
      end
    elsif @state == 3
      if @n == 1
        @state = 0
      end
    end
  end
end
