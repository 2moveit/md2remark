files = Dir['*.md']
template = File.read('template/template.html')
puts template
files.each do |file|
	puts "Reading #{file}"
	content = File.read(file)
	result = template.gsub('__include_md_here__', content)
	File.open("#{File.basename(file, '.md')}.html", "w") {|file| file.puts result}
end