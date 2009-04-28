#The CopyPirate
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

#sync commits to remote repository"
require "yaml"
require "lib/map/mapfiles.rb"

task :sync do
  sh "git push"
end

task :create do
  files = MapFiles.new()
  files.create("blank.map")
end

task :pack do
  FileUtils.mkdir('krpge-0.0.3')
  FileUtils.cp_r('lib','krpge-0.0.3/lib')
  FileUtils.cp_r('data','krpge-0.0.3/data')
  FileUtils.cp('AUTHORS','krpge-0.0.3/AUTHORS') 
  FileUtils.cp('GPL','krpge-0.0.3/GPL')
  FileUtils.cp('README','krpge-0.0.3/README')          
  FileUtils.cp('app.rb','krpge-0.0.3/app.rb')
  FileUtils.cp('mapeditor.rb','krpge-0.0.3/mapeditor.rb')
  FileUtils.cp('Rakefile','krpge-0.0.3/Rakefile')
  sh 'tar -cf krpge-0.0.3.tar krpge-0.0.3'
  sh 'bzip2 krpge-0.0.3.tar'
end

task :package do
end

task :test do
  sh 'ruby test/test.rb'
end
