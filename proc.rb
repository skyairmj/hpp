src_dir = 'src'
target_dir = 'target'

raise RuntimeError.new('HTML source files should be put under the "src" folder') unless Dir.exists?(src_dir)
Dir.mkdir(target_dir) unless Dir.exists?(target_dir)

Dir.glob(File.expand_path('*.html', src_dir)) do |src_path|
  next if src_path.include? '_include_'
  File.open(src_path.sub(src_dir, target_dir), 'w') do |output_html|
    File.open(src_path, 'r') do |source_html|
      while line = source_html.gets
        r = /<!--#include src=['"](?<file>.*)['"]-->/.match line
        if r.nil?
          output_html.puts line
        else
          include_html = File.open(File.expand_path(r[:file], src_dir), 'r').read
          output_html.puts "<!--include file '#{r[:file]}' Begin-->"
          output_html.puts include_html
          output_html.puts "<!--include file '#{r[:file]}' End-->"
        end
      end
    end
  end
end
