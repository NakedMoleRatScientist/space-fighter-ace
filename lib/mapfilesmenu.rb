#Mapeditor program
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

class MapFilesMenu
  def initialize
    @data = UiData.new("data/mapedit.yml")
    @q = Rubygame::EventQueue.new()
    @background = Rubygame::Surface.load("data/mapeditor.jpeg")
    @mode = true
    draw()
    @mapfiles = MapFiles.new()
    @mapfiles.directory("data/maps")
    @ui = MapFilesMenuUi.new(@data)
    @ui.extract(@mapfiles.fileslist())
    @ui.logger.intro()
    @ui.refresh()
  end
  def draw
    @background.blit(@data.display.screen,[0,0])
  end
  def menu
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
          when Rubygame::K_TAB
            @data.type.switch() 
            if @mode == true
              @mode = false
            else
              @mode = true
              @data.type.clean()
            end
            @ui.type.inputmatch()
          end
          keymode(ev)
        end
        if @mode == false
          draw()
          @data.type.active(ev)
          @data.type.render()
          @data.display.screen.update(0,750,800,18)
        end
      end
      if @mode == true
        @data.display.screen.flip()
      end
    end
  end
  def keymode ev
    if @mode == true
      draw()
      @ui.refresh()
      case ev.key
      when Rubygame::K_J
        @ui.scroller.change()
      end
    end
  end
end
