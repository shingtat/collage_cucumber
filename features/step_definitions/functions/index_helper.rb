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