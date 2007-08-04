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

#Youcan contact the author at wikipediankiba@gmail.com

class Controller
  def initialize data
    @data = data
    @data.clear()
    @background = Rubygame::Surface.load_image("data/game/starfield.jpeg")
    undraw()
    @player = Player.new()
    @weapon = Weapon.new()
    @clock = Rubygame::Clock.new
    @clock.target_frametime= 40
    @q = Rubygame::EventQueue.new()
    @enemy = Enemy.new(@weapon)
    @collide = CollideDetector.new(@weapon,@enemy,@player)
    mode()
  end
  def undraw
   @background.blit(@data.display.screen,[0,0])
  end
  def action
    @player.draw(@data.display.screen)
    if @enemy.state != false
       @enemy.draw(@data.display.screen)
       @enemy.act()
    end
  end
  def mode
    loop do
      @clock.tick
      @q.each do |ev|
	case ev
	when Rubygame::QuitEvent
	  Rubygame.quit()
	  exit
	when Rubygame::KeyDownEvent
	  case ev.key
	  when Rubygame::K_ESCAPE
	    return
	  when Rubygame::K_RIGHT
	    @player.action = 10
	    @act = true
	  when Rubygame::K_LEFT
	    @player.action = -10
            @act = false
	  when Rubygame::K_SPACE
	    @weapon.fire(@player.info)
	  end
	when Rubygame::KeyUpEvent
          case ev.key
          when Rubygame::K_RIGHT
	    if @act != false
	      @player.action = 0
	    end
          when Rubygame::K_LEFT
            if @act != true
              @player.action = 0
            end
          end
	end
      end
      undraw()
      @player.act()
      @collide.collide()
      @weapon.draw(@data.display.screen)
      action()
      @data.display.screen.flip()
      @clock.tick()
      if @player.state == false
        return
      end
    end
  end
end
