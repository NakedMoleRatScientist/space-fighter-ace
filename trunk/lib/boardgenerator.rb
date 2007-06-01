#Copyright (C) 2006 by Han Dao
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

#This is the game SpaceFighterAce
#You can contact the author at wikipediankiba@gmail.com
class StatFileGenerator
	attr_accessor :stat
	def initialize
		@file = FileSys.new()
		@filename = "stat.yml"
		@stat = stat
		check()
	end
	def check
		unless File.exist?(@filename)
			create()
		else
			@stat = @file.yaml_read(@filename)
		end
	end
	def create
		data = []
		count = 1
		10.times do 
			data << ["player#{count.to_s}",0]
			count +=1
		end
		@file.yaml_write(data , @filename)
		@stat = @file.yaml_read(@filename)
	end
	def save
		@file.yaml_write(@stat, @filename)
	end
end