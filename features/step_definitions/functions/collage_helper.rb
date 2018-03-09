
def topic_bot()
	page.driver.evaluate_script <<-EOS
		function() {
		var ele  = document.getElementById('topic');
		var rect = ele.getBoundingClientRect();
		return rect.bottom;
		}();
	EOS
end

def image_top()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('main_image');
    	var rect = ele.getBoundingClientRect();
    	return rect.top;
  	}();
	EOS
end

def image_left()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('main_image');
    	var rect = ele.getBoundingClientRect();
    	return rect.left;
  	}();
	EOS
end

def image_right()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('main_image');
    	var rect = ele.getBoundingClientRect();
    	return rect.right;
  	}();
	EOS
end

def image_width()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('main_image');
    	return ele.width;
  	}();
	EOS
end

def image_height()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('main_image');
    	return ele.height;
  	}();
	EOS
end

def image_bot()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('main_image');
    	var rect = ele.getBoundingClientRect();
    	return rect.bottom;
  	}();
	EOS
end

def input_top()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('text_input');
    	var rect = ele.getBoundingClientRect();
    	return rect.top;
  	}();
	EOS
end

def input_right()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('text_input');
    	var rect = ele.getBoundingClientRect();
    	return rect.right;
  	}();
	EOS
end

def input_bot()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('text_input');
    	var rect = ele.getBoundingClientRect();
    	return rect.bottom;
  	}();
	EOS
end

def build_top()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('build');
    	var rect = ele.getBoundingClientRect();
    	return rect.top;
  	}();
	EOS
end

def build_left()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('build');
    	var rect = ele.getBoundingClientRect();
    	return rect.left;
  	}();
	EOS
end

def build_bot()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('build');
    	var rect = ele.getBoundingClientRect();
    	return rect.bottom;
  	}();
	EOS
end

def export_top()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('export');
    	var rect = ele.getBoundingClientRect();
    	return rect.top;
  	}();
	EOS
end

def export_bot()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('export');
    	var rect = ele.getBoundingClientRect();
    	return rect.bottom;
  	}();
	EOS
end

def history_top()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('history');
    	var rect = ele.getBoundingClientRect();
    	return rect.top;
  	}();
  	EOS
end
