#!/usr/bin/env ruby
require "rubygems"
require "thor"

class Hpp < Thor
  desc "process SRC TARGET", "process HTML files under SRC folder to TARGET folder"
  def process(src='src', target='target')
    raise RuntimeError.new("There is NO '#{src}' folder in current working directory") unless Dir.exists?(src)
    Dir.mkdir(target) unless Dir.exists?(target)

    Dir.glob(File.expand_path('*.html', src)) do |src_path|
      next if src_path.include? '_include_'
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
  end
end

Hpp.start