require 'rubygems'
require 'rubygems/package_task'
require ''

Gem::PackageTask.new(specification) do |package|
  package.need_zip = true
  package.need_tar = true
end

desc 'install gem locally'
task :install => :gem do
  `gem install pkg/hpp-0.1.gem`
end

desc 'uninstall gem locally'
task :uninstall do
  `gem uninstall hpp -x`
end
