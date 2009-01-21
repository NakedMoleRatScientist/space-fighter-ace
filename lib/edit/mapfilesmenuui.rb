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

class MapFilesMenuUi
  attr_accessor :string , :cycle , :return , :file, :size, :data , :scroller , :type , :logger
  def initialize data
    @data = data
    @string = []
    @cycle = 0
    @return = 0
    @file = 0
    @size = 0
    @scroller = FilesScrollerUi.new(self)
    @logger = LoggerUi.new(@data)
    @type = MapFilesTypeUi.new(self)
    @editmode = EditMode.new(@data,@logger)
  end
  def text
    @scroller.text()
    @type.text()
    @logger.text()
  end
  # NOTE: Return is the number of time that the menu will scroll. The values from n - 10 represent the time it will scroll down. The addition of 1 represent the repeat value.
  def extract dir
    n = 0
    dir.each do |string|
      @string << string
      n += 1
    end
    @size = @string.size()
    @return = (n - 10) + 1
  end
  def refresh
    @data.clear()
    text()
    @scroller.process()
  end
  def typedraw
    @data.text.render.draw(:input)
  end
  def editmodeactive
    @editmode.setfiles(@string[@file])
    @editmode.run()
  end
end
