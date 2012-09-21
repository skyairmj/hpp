require 'systemu'

desc 'build gem'
task :gem do
  systemu %q(gem build hpp.gemspec)
end

desc 'install gem locally'
task :install => :gem do
  systemu %q(gem install hpp-0.1.0.gem)
end

desc 'uninstall gem locally'
task :uninstall do
  systemu %q(gem uninstall hpp -x)
end
