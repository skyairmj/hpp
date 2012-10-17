$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'hpp/version'

desc 'build gem'
task :gem do
  system "gem build hpp.gemspec"
end

desc 'install gem locally'
task :install => :gem do
  system "gem install hpp-#{Hpp::VERSION}.gem --no-ri --no-rdoc"
end

desc 'uninstall gem locally'
task :uninstall do
  system "gem uninstall hpp -x"
end

desc 'publish gem to rubygems.org'
task :publish do
  system "gem push hpp-#{Hpp::VERSION}.gem"
end

desc 'release hpp with git tagging & rubygems publishment'
task :release do
  system "git tag v#{Hpp::Version}"
  system "git push origin master"
  system "git push origin v#{Hpp::Version}"
  system "gem push hpp-#{Hpp::Version}.gem"
end
