#YourGameHere
#Copyright (C) 2008 YourNameHere

#Kiba Role Playing Game Engine(KRPGE)
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


#To clear up confusion you may have about the directions of number:
#The lower or the more negative a number for the horizontial direction, often defined as x, the more to the left you are.
#The bigger or the more postive a number, the more to the right you are.
#As for the vertical numbers, the greater or more postive the number, the lower your height.
#Consequently, the lower your vertical position is, the greater your height.

class Camera
  attr_writer :adjustbackward , :adjustforward, :adjustdown, :adjustup
  attr_reader :width , :height , :characters , :following , :map , :items
  def initialize log
    @log = log
    @width = 0
    @height = 0
    @adjustbackward = 250
    @adjustforward = 350
    @adjustdown = 530
    @adjustup = 60
    @rect = Rect.new(80,60,0,0)
  end
  def reset
    @rect = Rect.new(80,60,0,0)
    @width = 0
    @height = 0
  end
  def set engine
    @characters = engine.characters_tracker
    @following = engine.following
    @map = engine.mapengine
    @items = engine.itemstracker
  end
  def compute
    if @following == nil
      puts"ERROR: Camera object have nothing to follow."
      return false
    end
    backwardcompute()
    forwardcompute()
    downcompute()
    upcompute()
    return true
  end
  def backwardcompute
    # NOTE: If the followed's horizontal position defined by the x in followed's rect is  is less than @adjustback, the map will move backward.
    if @following.rect.x < @adjustbackward
      width = @adjustbackward - @following.rect.x
      @width += width
      if leftlimit() == true
        return
      end
      synchronization(width,0)
    end
  end
  def forwardcompute
    # NOTE: If the followed's horizontal position defined by the x in player's rect is greater than @adjustforward, than the map will move forward.
    if @following.rect.x > @adjustforward
      width = @following.rect.x - @adjustforward
      @width -= width
      if rightlimit() == true
        return
      end
      width = -width
      synchronization(width,0)
    end
  end
  def downcompute
    # NOTE: If the followed's vertical position defined by the y in player's rect is greater than @adjustdown, than the map will move down.
    if @following.rect.y > @adjustdown
      height = @following.rect.y - @adjustdown
      @height -= height
      if downlimit() == true
        return
      end
      height = -height
      synchronization(0,height)
    end
  end
  def upcompute
    # NOTE: If the followed's vertical position defined by the y in player's rect is lower than @upadjust, than the map will move up.
    if @following.rect.y < @adjustup
      height = @adjustup - @following.rect.y
      @height += height
      if uplimit() == true
        return
      end
      synchronization(0,height)
    end
  end
  def rightlimit
    # NOTE: -1600 is the limit of moving to the right by moving the maps further to the left. If camera goes beyond -1600, there will be blank spaces. The horizontal size is said to be 2400.
    # Substract 800 from the mapsize and you get the limit of camera movement. 800 is the horizontal resolution that the map engine is designed for.
    if @width < -1600
      @width = -1600
      s = @rect.x + 1600
      synchronization(s,0)
      return true
    end
    return false
  end
  def leftlimit
    # NOTE: 0 is the beginning of the map, the very left. So the camera's movement stop there.
    if @width > 0
	@width = 0
	s = - @rect.x
	synchronization(s,0)
	return true
    end
    return false
  end
  def downlimit
    # NOTE: -1200 is the limit of camera movement for moving down the screen. To move beyond there is to see blank spaces. 
    # Take 600, the default vertical resolution that the map engine is designed for and substract from the mapsize of 1800, and you get 1200. That where the camera movement limit come from.
    if @height < -1200
      @height = -1200
      s = - (@rect.y + 1200)
      synchronization(0,s)
      return true
    end
    return false
  end
  def uplimit
    # NOTE: A height of 0 is to mark the beginning of the map, the top corner. Thus it is the camera movement limit for moving up.
    if @height > 0
      @height = 0
      s = - (@rect.y)
      synchronization(0,s)
      return true
    end
    return false
  end
  # NOTE: Move everything
  # X as calculated is the difference that the camera will make up in horizontal movement to make sure that the object that the camera is following stays in the relative range of the camera.
  # Y as calculated is for the horonzontal movement.
  # This method will move all the objects on the map by the x or y's value.
  def synchronization x= 0 , y = 0
    if @characters != nil
      @characters.move_all_characters(x,y)
    end
    @rect.x += x
    @rect.y += y
    if @map != nil
      @map.move(x,y)
    end
    if @items != nil
      @items.move(x,y)
    end
    if @following.kind_of?(Character) == false
      @following.rect.x += x
      @following.rect.y += y
    end
  end
end
