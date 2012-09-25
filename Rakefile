require 'systemu'

desc 'build gem'
task :gem do
  systemu %q(gem build hpp.gemspec)
end

desc 'install gem locally'
task :install => :gem do
  systemu %q(gem install hpp-0.1.1.gem --no-ri --no-rdoc)
end

desc 'uninstall gem locally'
task :uninstall do
  systemu %q(gem uninstall hpp -x)
end

desc 'publish gem to rubygems.org'
task :publish do
  systemu %q(gem push hpp-0.1.1.gem)
end