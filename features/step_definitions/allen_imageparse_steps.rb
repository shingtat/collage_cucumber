def read_file()
	File.readlines('/Users/allenhuang/Downloads/downloadedCollageDump').each do |line|
	    p line
	end
end

And(/^I should read this file$/) do
	read_file()
end