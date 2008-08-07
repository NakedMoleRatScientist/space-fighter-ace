#YourGameHere
#Copyright (C) 2008 YourNameHerea

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

class Controller
  def initialize data
    @data = data
    @engine = GameEngine.new()
    @engine.setmapsurface([800,600])
    @engine.setmapfile("data/maps/blank.map")
    @engine.setimages("data/images.yml")
    @engine.setchar(CharType.new(@engine))
    @engine.setitem(ItemType.new())
    @engine.setadjustforward(450)
    @engine.setadjustbackward(350)
    @engine.setadjustdown(350)
    @engine.setadjustup(250)
    @engine.setfollow("Player")
    @engine.setup()
    @engine.set_cam_mode()
    @engine.ruleset(GameLaw.new(@engine))
    @player = @engine.following
    @q = Rubygame::EventQueue.new()
    @active = false
    @hud = Hud.new(@data,@engine)
  end
  def action
    if @active == true
      @player.movement.increase()
    end
    @engine.compute()
    @engine.draw(@data.display.screen)
  end
  def draw
    @hud.text()
  end
  # NOTE: For the attribute direction of player:
  # 1. Up
  # 2. Down
  # 3. Right
  # 4. Left
  def mode
    loop do
      @engine.prevposition()
	    @q.each do |ev|
        case ev
        when Rubygame::QuitEvent
          Rubygame.quit()
          exit
        when Rubygame::KeyDownEvent
          case ev.key
          when Rubygame::K_ESCAPE
            Rubygame.quit()
            exit
          end
          if move(ev) == true
            @active = true
          end
          rotate(ev)
        when Rubygame::KeyUpEvent
          @active = false
		    end
      end
      action()
      draw()
      @data.display.screen.flip()
    end
  end
  def move ev
    case ev.key
    when Rubygame::K_W
      @player.movement.directionchange(1)
    when Rubygame::K_S
      @player.movement.directionchange(2)
    when Rubygame::K_D
      @player.movement.directionchange(3)
    when Rubygame::K_A
      @player.movement.directionchange(4)
    when Rubygame::K_Q
      @player.movement.directionchange(0)
    when Rubygame::K_E
      @player.movement.change_brust()
    end
    return false
  end
  def rotate ev
    case ev.key
    when Rubygame::K_RIGHT
      @player.rotation.change_rotate_speed(10)
    when Rubygame::K_LEFT
      @player.rotation.change_rotate_speed(-10)
    when Rubygame::K_DOWN
      @player.rotation.change_rotate_speed(0)
    end
  end
end
