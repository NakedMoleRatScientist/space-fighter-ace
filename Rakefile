require "yaml"
require "lib/map/mapfiles.rb"

task :sync do
  sh "git push"
end

task :create do
  files = MapFiles.new()
  files.create("blank.map")
end

task :package do
  manifest = "manifest.yml"
  manifest = File.read(manifest)
  manifest = YAML::load(manifest)
  name = manifest['version']
  FileUtils.mkdir(name)
  manifest['files'].each {|filename|
    FileUtils.cp(filename, "#{name}/#{filename}")
  }
  manifest['dir'].each {|dir|
    FileUtils.cp_r(dir, "#{name}/#{dir}")
  }
  sh "tar -cf #{name}.tar #{name}"
  sh "bzip2 #{name}.tar"
end

task :package do
end

task :test do
  sh 'ruby test/test.rb'
end
