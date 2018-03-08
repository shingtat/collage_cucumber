
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


Given(/^I am on the Collage page$/) do
  visit "http://localhost:8080/Implementation/collage.html"
end

Then(/^I should see the search box with placeholder text "([^"]*)"$/) do |placeholdertext|
  expect(find_field('text_input')['placeholder']).to eq placeholdertext
end

And(/^I should see the Title at the top of the page$/) do
	# Title is top of the page if the bottom of the title is above every other element
	posTopic = topic_bot() 
	
	posImage = image_top()
	
	posInput = input_top()
	posBuild = build_top()
	
	posExport = export_top()

	posHistory = history_top()

	expect(posTopic).to be < posImage
	expect(posTopic).to be < posInput
	expect(posTopic).to be < posBuild
	expect(posTopic).to be < posExport
	expect(posTopic).to be < posHistory
end

And(/^I should see the Collage underneath the Title$/) do
	posTopic = topic_bot()

	posImage = image_top()

	# NEED TO CHECK FOR BUILD ANOTHER BUTTON

	# posInput = input_top()

	# posHistory = history_top()

	expect(posImage).to be > posTopic
	# expect(posImage).to be < posInput
	# expect(posImage).to be < posHistory
end

And(/^I should see the Collage centered in the page$/) do
	imageLeft = image_left()
	imageRight = image_right()

	windowWidth = page.driver.browser.manage.window.size[0]

	# distance from collage to the right edge of window
	distRight = windowWidth - imageRight

	# if collage centered than the distance from left (imageLeft) == distRight
	expect(imageLeft).to eq distRight
end

And(/^I should see the Collage meets the width requirements$/) do
	imageWidth = image_width()
	windowWidth = page.driver.browser.manage.window.size[0]

	maxWidth = (windowWidth.to_f * 0.7)

	expect(imageWidth). to be >= 800
	expect(imageWidth). to be >= (windowWidth.to_f * 0.4)
	if maxWidth > 800
		expect(imageWidth). to be <= maxWidth
	end
end

And(/^I should see the Collage meets the height requirements$/) do
	imageHeight = image_height()
	windowHeight = page.driver.browser.manage.window.size[1]

	maxHeight = windowHeight.to_f * 0.5

	expect(imageHeight). to be >= 600
	expect(imageHeight). to be >= (windowHeight.to_f * 0.35)
	if  maxHeight > 600
		expect(imageHeight). to be <= maxHeight
	end
end

And(/^I should see the Build Another Collage button underneath the collage$/) do
	posImage = image_bot()
	posBuild = build_top()

	expect(posBuild).to be > posImage
end

And(/^I should see the Build Another Collage button right of center$/) do
	buildLeft = build_left()

	width = page.driver.browser.manage.window.size[0]

	expect(buildLeft).to be > width/2
end


And(/^I should see the Input Box to the left of the Build Another Collage button$/) do
	posInput = input_right()
	posBuild = build_left()

	expect(posInput).to be < posBuild
end

And(/^I should see the Previous Collage Picker at the bottom of the page$/) do
	posHistory = history_top()

	posTopic = topic_bot()

	posImage = image_bot()

	posBuild = build_bot()
	posInput = input_bot()

	posExport = export_bot()

	expect(posHistory).to be > posTopic
	expect(posHistory).to be > posImage
	expect(posHistory).to be > posBuild
	expect(posHistory).to be > posInput
	expect(posHistory).to be > posExport

end

When(/^I enter "([^"]*)" in the search box$/) do |searchArg|
  fill_in('text_input', :with => searchArg)
end

When(/^press search$/) do
  # find_field('text_input').native.send_key(:enter)
end

Then(/^I should see the title change for "([^"]*)"$/) do |arg1|
  # expect(page.find_by_id('topic').text).to eq "Collage for Topic " + arg1
end

