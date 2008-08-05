#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2008 Han Dao
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
#
#You can contact the author at wikipediankiba@gmail.com

class Rotation
  def initialize fighter , image
    @fighter = fighter
    @orig_image = Surface.load(image)
    @rotatespeed = 0
    @rotate = 0
  end
  def rotation
    if @rotatespeed == 0
      return
    end
    @fighter.image = @orig_image
    @rotate += @rotatespeed
    @image = @image.rotozoom(@rotate,[1,1],true)
  end
  def change_rotate_speed n
    @rotatespeed = n
  end
end
