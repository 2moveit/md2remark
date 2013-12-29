require 'FileUtils'

root_dir = File.expand_path('..', File.dirname(__FILE__)) 
files = Dir[File.join(root_dir, 'input_markdown/*.md')]
template = File.read(File.join(root_dir, 'src/template/template.html'))

FileUtils.cp_r(File.join(root_dir, 'src/css'), File.join(root_dir, 'output_remark'))

files.each do |file|
	content = File.read(file)
	result = template.gsub('__include_md_here__', content)
	html_file =  File.join(root_dir,"output_remark/#{File.basename(file, '.md')}.html")
	File.open(html_file, "w") {|file| file.puts result}
	puts "#{html_file} created."
end