$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

require "hpp/version"

Gem::Specification.new do |gem|
  gem.name = "hpp"
  gem.summary = "A Command Line tool for Pre-Processing HTML"
  gem.authors = ["Ming Jin"]
  gem.email =  ["skyairmj@gmail.com"]
  gem.homepage = "https://github.com/mingjin/hpp"

  gem.version = Hpp::VERSION
  gem.platform = Gem::Platform::RUBY

  gem.require_path = "lib"
  gem.files        = Dir['lib/**/*.rb']
  gem.executables  = "mp"

  gem.add_runtime_dependency 'thor', '>= 0.16.0'
end
