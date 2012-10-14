# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'hpp/version'

Gem::Specification.new do |gem|
  gem.name = "hpp"
  gem.version = Hpp::VERSION
  gem.date    = Date.today.to_s
  
  gem.summary = "A Command Line tool for HTML Pre-Processing"
  gem.description = "This is a very simple command line tool for HTML file pre-processing"
  gem.authors = ["Ming Jin"]
  gem.email =  ["skyairmj@gmail.com"]
  gem.homepage = "https://github.com/mingjin/hpp"

  gem.platform = Gem::Platform::RUBY

  gem.require_path = "lib"
  gem.files        = Dir['lib/hpp/*.rb']
  gem.executables << 'hpp'

  gem.add_runtime_dependency 'thor', '>= 0.16.0'
  gem.add_runtime_dependency 'listen', '>= 0.5.3'
end
