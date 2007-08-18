#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2007  Han Dao
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

class Scoreboard
  attr_accessor :points
  def initialize data
    @data = data
    @board = BoardGenerator.new
    @high = @board.data['high']
    @points = 0
  end
  def hit
    @points += 1
  end
  def check
    if @points > @high
      @high = @points
      puts @points
      @board.data['high'] = @high
      @board.data['name'] = "winner"
      puts @board.data['name']
      @board.save()
    end
  end
end