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

class FilesScrollerUi
  def initialize menu
    @menu = menu
    @data = @menu.data
  end
  def text
    @data.declare(:listing)
    @data.text.add("Listing content in map directory...",0,0)
  end
  # NOTE: Scroll down the content list
  def change
    if @menu.string.size < 11
      return
    end
    @menu.cycle += 1
    if @menu.cycle == @menu.return
      @menu.cycle = 0
    end
  end
  def process
    n = 1
    limit = 1
    y = 30
    cycle = 0
    @menu.string.each do |s|
      if cycle == @menu.cycle
        @data.text.add("#{n} #{s}",0,y)
        if limit == 10
          if @menu.string.size() > 10
            @data.text.add("And #{3 - @menu.cycle} more down the list.",0,y+30)
          end
          return
        end
        limit += 1
        y += 30
      else
        cycle += 1
      end
      n += 1
    end
  end
end
