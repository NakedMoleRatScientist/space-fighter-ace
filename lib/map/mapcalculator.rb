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


class MapCalculator
  attr_accessor :x , :y , :o , :defaultx , :defaulty , :defaultcolumns, :defaultrows
  def initialize engine
    @engine = engine
    @x = x
    @y = y
    @o = o
    @defaultx = 80
    @defaulty = 60
    @defaultcolumns = 30
    @defaultrows = 30
  end
  # NOTE: Calculate every possible location of every map objects. The results are feed in action.call, which use them as appropriately.
  def rectlocation object , &action
    rows = 0
    columns = 0
    object.each do |o|
      a = columns * @defaultx + @engine.length
      b = rows * @defaulty + @engine.height
      @x = a
      @y = b
      @o = o
      action.call()
      columns += 1
      if columns == @defaultcolumns
        rows +=  1
        columns = 0
      end
      if rows == @defaultrows
        return
      end
    end
    reset()
  end
  def calculate_pos pos
    rows = 0
    columns = 0
    x = 0
    y = 0
    pos.times do |t|
      x = columns * @defaultx + @engine.length
      y = rows * @defaulty + @engine.height
      columns += 1
      if columns == @defaultcolumns
	rows += 1
	columns = 0
      end
      if rows == @defaultrows
        break
      end
    end
    return x , y
  end
  def reset
    @defaultx = 80 
    @defaulty = 60
    @defaultrows = 30
    @defaultcolumns = 30
  end
end
