#Your game here
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
#
#You can contact the author at wikipediankiba@gmail.com

class GameSetup
  include Rubygame::EventHandler::HasEventHandler
  def initialize
    @data = UiData.new("data/setup.yml")
    @q = Rubygame::EventQueue.new()
    @control = Controller.new(@data)
    @background = Rubygame::Surface.load("data/startscreen.jpeg")
    @background.blit(@data.display.screen,[0,0])
  end
  def ui
    @data.declare(:menu)
    @data.imageui.add("play.png",300,300)
    @data.imageui.active() {
      control_execute()
    }
    @data.imageui.add("quit.png",300,330)
    @data.imageui.active() {
      quit()
    }
  end
  def quit
    Rubygame.quit()
    throw :quit
  end
  def control_execute
    @control.mode()
  end
  def start
    hook_quit()
    hook_enter()
    catch(:throw) do
        loop do
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
          when Rubygame::K_RETURN
            @control.mode()
          end
        when Rubygame::MouseDownEvent
          @data.collide.check()
        end
        @data.mouse.tell(ev)
      end
      end
      @data.mouse.update()
      @data.display.screen.flip()
    end
    exit
  end
  def hook_quit
    quit_hook = {
      :escape => :quit ,
      :q => :quit
    }
    make_magic_hooks(quit_hook)
  end
  def hook_enter
    enter_hook = {
      :return => :control_execute
    }
    make_magic_hooks(enter_hook)
  end
end
