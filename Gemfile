source :rubygems

gem 'rake'
gem 'thor'
gem 'listen'

require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']

group :development do
  case HOST_OS
    when /darwin/i
      gem 'rb-fsevent'
    when /linux/i
      gem 'rb-inotify'
    when /mswin|windows/i
      gem 'wdm'
  end
end