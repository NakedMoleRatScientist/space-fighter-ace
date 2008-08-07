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


#To clear up confusion you may have about the directions of number:
#The lower or the more negative a number for the horizontial direction, often defined as x, the more to the left you are.
#The bigger or the more postive a number, the more to the right you are.
#As for the vertical numbers, the greater or more postive the number, the lower your height.
#Consequently, the lower your vertical position is, the greater your height.

class Camera
  def initialize engine
    @engine = engine
    @mapobj = @engine.mapobj
    @items = @engine.engine.itemstrack.items
    @c = @engine.engine.charstrack.characters
    @terrain = @engine.terrain
    @follow =  @engine.engine.following
    @adjustback = 250
    @adjustforward = 350
    @adjustdown = 530
  end
  def compute
    backwardcompute()
    forwardcompute()
    downcompute()
    upcompute()
  end
  def backwardcompute
    # NOTE: If the followed's horizontal position defined by the x in followed's rect is  is less than 250, the map will move backward.
    if @follow.rect.x < @adjustback
	    length = 250 - @follow.rect.x
	    @engine.length += length
	    if leftlimit() == true
        return
	    end
	    synchronization(length,0)
    end
  end
  def forwardcompute
    # NOTE: If the followed's horizontal position defined by the x in player's rect is greater than 350, than the map will move forward.
    if @follow.rect.x > @adjustforward
	    length = @follow.rect.x - 350
	    @engine.length -= length
	    if rightlimit() == true
        return
	    end
	    length = -length
	    synchronization(length,0)
    end
  end
  def downcompute
    # NOTE: If the followed's vertical position defined by the y in player's rect is greater than 530, than the map will move down.
    if @follow.rect.y > @adjustdown
	    length = @follow.rect.y - 530
	    @engine.height -= length
	    if downlimit() == true
        return
	    end
	    length = -length
	    synchronization(0,length)
    end
  end
  def upcompute
    # NOTE: If the followed's vertical position defined by the y in player's rect is lower than 60, than the map will move up.
    if @follow.rect.y < 60
	    length = 60 - @follow.rect.y
	    @engine.height += length
	    if uplimit() == true
        return
	    end
	    synchronization(0,length)
    end
  end
  def rightlimit
    # NOTE: -1600 is the limit of moving to the right by moving the maps further to the left. If camera goes beyond -1600, there will be blank spaces. The horizontal size is said to be 2400.
    # Substract 800 from the mapsize and you get the limit of camera movement. 800 is the horizontal resolution that the map engine is designed for.
    if @engine.length < -1600
	    @engine.length = -1600
	    s = - (@mapobj[0].rect.x + 1600)
	    synchronization(s,0)
	    return true
    end
    return false
  end
  def leftlimit
    # NOTE: 0 is the beginning of the map, the very left. So the camera's movement stop there.
    if @engine.length > 0
	    @engine.length = 0
	    s = - @mapobj[0].rect.x
	    synchronization(s,0)
	    return true
    end
    return false
  end
  def downlimit
    # NOTE: -1200 is the limit of camera movement for moving down the screen. To move beyond there is to see blank spaces. 
    # Take 600, the default vertical resolution that the map engine is designed for and substract from the mapsize of 1800, and you get 1200. That where the camera movement limit come from.
    if @engine.height < -1200
	    @engine.height = -1200
	    s = - (@mapobj[0].rect.y + 1200)
	    synchronization(0,s)
	    return true
    end
    return false
  end
  def uplimit
    # NOTE: A height of 0 is to mark the beginning of the map, the top corner. Thus it is the camera movement limit for moving up.
    if @engine.height > 0
	    @engine.height = 0
	    s = - (@mapobj[0].rect.y)
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
    @mapobj.each do |m|
      m.rect.x += x
      m.rect.y += y
    end
    @c.each do |c|
      c.rect.x += x
      c.rect.y += y
    end
    @items.each do |i|
      i.rect.x += x
      i.rect.y += y
    end
    @terrain.each do |t|
      t.rect.x += x
      t.rect.y += y
    end
    notacharacter = @follow.kind_of?(Character)
    if notacharacter == false
      @follow.rect.x += x
      @follow.rect.y += y
    end
  end
end
