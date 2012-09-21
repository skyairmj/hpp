Gem::Specification.new do |gem|
  gem.name = "hpp"
  gem.summary = "A Command Line tool for HTML Pre-Processing"
  gem.version = "0.1.0"
  gem.authors = ["Ming Jin"]
  gem.email =  ["skyairmj@gmail.com"]
  gem.homepage = "https://github.com/mingjin/hpp"

  gem.platform = Gem::Platform::RUBY

  gem.require_path = "lib"
  gem.files        = Dir['lib/**.rb']
  gem.executables << 'hpp'

  gem.add_runtime_dependency 'thor', '>= 0.16.0'
end
