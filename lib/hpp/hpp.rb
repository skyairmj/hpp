require 'thor'
require 'fileutils'
require 'listen'

module Hpp
  class Hpp < Thor
    include FileUtils
  
    desc 'process SRC TARGET', 'process HTML files under SRC folder to TARGET folder'
    method_options :daemon => false
    def process(src='src', target='target')
      raise RuntimeError.new("There is NO '#{src}' folder in current working directory") unless Dir.exists?(src)
      Dir.mkdir(target) unless Dir.exists?(target)
    
      if options.daemon?
        Listen.to(src, :relative_paths => true) do |modified, added, removed|
          _process(src, target)
          print "Changes of files from '#{src}' Detected: "
          print "#{modified} Modified, " unless modified.empty?
          print "#{added} Added, " unless added.empty?
          print "#{removed} Removed, " unless removed.empty?
          puts "And Re-Generated output files into '#{target}'"
        end.start
      elsif
        _process(src, target)
      end
    end
  
    private
    def _process(src, target)
      Dir.glob(File.expand_path('*.html', src)) do |src_path|
        next if src_path.include? '_'
        File.open(src_path.sub(src, target), 'w') do |output_html|
          File.open(src_path, 'r') do |source_html|
            while line = source_html.gets
              r = /<!--#include src=['"](?<file>.*)['"]-->/.match line
              if r.nil?
                output_html.puts line
              else
                include_html = File.open(File.expand_path(r[:file], src), 'r').read
                output_html.puts "<!--include file '#{r[:file]}' Begin-->"
                output_html.puts include_html
                output_html.puts "<!--include file '#{r[:file]}' End-->"
              end
            end
          end
        end
      end
    
      Dir.foreach(src) do |file|
        next if /^\.+/.match file
        file = File.expand_path(file, src)
        cp_r file, target if File.directory?(file)
      end
    
    end
=begin  
    desc 'new project files', 'create a new HPP project'
    def new(name)
      raise RuntimeError.new("There is NO '#{src}' folder in current working directory") unless Dir.exists?(src)
    
    end
=end
  end
end