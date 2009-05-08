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
    @q.enable_new_style_events()
    @control = Controller.new(@data)
    @background = Rubygame::Surface.load("data/startscreen.jpeg")
    @background.blit(@data.display.screen,[0,0])
    @n = 0
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
    exit
  end
  def control_execute
    puts "You have entered game mode. #{@n}"
    @n += 1
    @control.mode()
  end
  def start
    hook_quit()
    hook_enter()
    loop do
      queue_through()
      @data.mouse.update()
      @data.display.screen.flip()
    end
  end
  def hook_quit
    quit_hook = {
      :escape => :quit ,
      Rubygame::Events::QuitRequested => :quit
    }
    make_magic_hooks(quit_hook)
  end
  def hook_enter
    enter_hook = {
      :return => :control_execute
    }
    make_magic_hooks(enter_hook)
  end
  def queue_through
    @q.each do |event|
      handle(event)
    end
  end
  def register(*objects)
    objects.each do |object|
      append_hook( :owner => object,
		   :trigger => Rubygame::EventTriggers::YesTrigger.new,
		   :action => Rubygame::EventActions::MethodAction.new(:handle)
		 )
    end
  end
end
