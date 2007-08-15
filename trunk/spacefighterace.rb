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

#You can contact the author at wikipediankiba@gmail.com
require 'rubygame'
require 'rubygems'
require 'rbgooey'
require 'yaml'
require "lib/controller.rb"
require "lib/starter.rb"
require "lib/player.rb"
require "lib/enemy.rb"
require "lib/weapon.rb"
require "lib/gameover.rb"
require "lib/collide.rb"
require "lib/scoreboard.rb"
require "lib/file.rb"
require "lib/boardgenerator.rb"
require "lib/timer.rb"
require "lib/enemytracker.rb"
include Rubygame
TTF.setup

game = Starter.new
game.ui()
game.play()
