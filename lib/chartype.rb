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

class CharType
  def initialize adapter
    @adapter = adapter
    @letter = 'A'
  end
  def options opt , x , y
    case opt
    when 1
      example2 = CharExample2.new(@adapter)
      example2.sets(x,y)
      example2.name = "Example " + @letter
      @letter.succ!
      return example2
    when 2
      player = Player.new(@adapter)
      player.name = "Player"
      player.sets(x,y)
      return player
    end
    return false
  end
end
