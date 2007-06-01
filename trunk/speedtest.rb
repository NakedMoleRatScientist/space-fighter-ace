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

#This is a benchmark test.
require 'rubygame'
require 'RbGooey'
require 'yaml'
require "lib/starter.rb"
require "lib/fighter.rb"
require "lib/enemy.rb"
require "lib/weapon.rb"
require "lib/gameover.rb"
require "lib/collide.rb"
require "lib/scoreboard.rb"
require "lib/file.rb"
require "lib/boardgenerator.rb"
require "test/alt_game.rb"
require "test/controller.rb"
require "benchmark"
include Benchmark
include Rubygame
TTF.setup
StatFileGenerator.new

class BenchTest
	def initialize
		@main = Main.new
		@main.screen_set(800,600)
		@main.fgcolor =[300,200,300]
		@main.bgcolor =[200,200,200]
		@main.font_set("freesansbold.ttf",15)
		test()
	end
	def test()
		bmbm(12) do |test|
			test.report("test1:") do
				Controller.new(@main)
			end
			test.report("test2:") do
				Controller.new(@main)
			end
			test.report("test3:") do
				Controller.new(@main)
			end
			test.report("test4:") do
				Controller.new(@main)
			end
			test.report("test5:") do
				Altcontroller.new(@main)
			end
		end
		bmbm(12) do |test|
			test.report("alt-test1:") do
				Altcontroller.new(@main)
			end
			test.report("alt-test2:") do
				Altcontroller.new(@main)
			end
			test.report("alt-test3:") do
				Altcontroller.new(@main)
			end
			test.report("alt-test4:") do
				Altcontroller.new(@main)
			end
			test.report("alt-test5:") do
				Altcontroller.new(@main)
			end
		end
    end
end

BenchTest.new