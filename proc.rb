Dir.glob('src/*.html') do |html|
  File.readlines(html).grep(/<!--#include src=".*"-->/) do |include|
    r = /src="(?<file>.*)"/.match(include)
    include_file = r[:file]
    puts include_file
    File.open('src/'+include_file, 'r') do |_include|
      puts _include.read
    end
  end

end
