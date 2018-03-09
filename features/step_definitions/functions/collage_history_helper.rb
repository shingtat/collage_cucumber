def get_history()
	page.driver.execute_script("
		var ele  = document.getElementById('history');
		return ele.children;")
end

def get_main_image()
	page.driver.execute_script("
		var ele  = document.getElementById('main_image');
		return [ele.width, ele.height];")
end

#passing in javascript elements into capybara requires changes in support/env.rb
def get_image_pos(ele)
	page.driver.execute_script("
		var ele  = document.getElementById(arguments[0].id);
		var rect = ele.getBoundingClientRect();
    	return [rect.top, rect.bottom];", ele)
end

def get_image_size(ele)
	page.driver.execute_script("
		var ele  = document.getElementById(arguments[0].id);
    	return [ele.width, ele.height];", ele)
end

def read_file(path)
	contents = []
	File.readlines(path).each do |line|
	    contents << line.chomp
	end
	return contents
end
