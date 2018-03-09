require_relative 'functions/collage_appearance_helper'
require_relative 'functions/collage_helper'

Given(/^error shown$/) do
  visit "http://localhost:8080/Implementation/index.html"
  fill_in('text_input', :with => 'a;lskdfjl;askdjfl;akjd;lka;kdjf;lakdjfl;s')
  click_button('build')
  sleep(12)
end

#Collage appearance
When(/^collage loads$/) do
  find_by_id("main_image")
end


Then(/^I should see the Collage centered in the page$/) do
	imageLeft = image_left()
	imageRight = image_right()

	windowWidth = page.driver.browser.manage.window.size[0]

	# distance from collage to the right edge of window
	distRight = windowWidth - imageRight

	# if collage centered than the distance from left (imageLeft) == distRight
	expect(imageLeft).to eq distRight
end


Then(/^I should see the Collage meets the width requirements$/) do
	imageWidth = image_width()
	windowWidth = page.driver.browser.manage.window.size[0]

	maxWidth = (windowWidth.to_f * 0.7)

	expect(imageWidth). to be >= 800
	expect(imageWidth). to be >= (windowWidth.to_f * 0.4)
	if maxWidth > 800
		expect(imageWidth). to be <= maxWidth
	end
end

Then(/^I should see the Collage meets the height requirements$/) do
	imageHeight = image_height()
	windowHeight = page.driver.browser.manage.window.size[1]

	maxHeight = windowHeight.to_f * 0.5

	expect(imageHeight). to be >= 600
	expect(imageHeight). to be >= (windowHeight.to_f * 0.35)
	if  maxHeight > 600
		expect(imageHeight). to be <= maxHeight
	end
end

Then(/^I should see the average size of the photos (after scaling) shall be 1 out of 20th of the available rectangular space$/) do
  expect(findAverage("/home/student/desktop/size.txt")).to eq(true)
end

Then(/^I should see Photos should be displayed in the collage with a random rotation of "([^"]*)" to "([^"]*)" degrees$/) do |angle1, angle2|
  confirm = angleConfirmation("/home/student/desktop/rotation.txt", angle1.to_i, angle2.to_i)
  expect(confirm).to eq(true)
end

Then(/^I should see that "([^"]*)" should be returned to the user in the main collage space$/) do |string|
  main_image_parent = page.driver.execute_script("
    var main_image  = document.getElementById('main_image');
    return main_image.parentElement;")
  error_parent = page.driver.execute_script("
    var error  = document.getElementById('error');
    return error.parentElement;")
  expect(main_image_parent).to eq(error_parent)
  expect(find_by_id('error').find('h2', text: string)).to be_truthy
end

Then(/^I should see that error text color is "([^"]*)"$/) do |color|
  h2 = find_by_id('error').find('h2')
  expect(h2.native.style('color')).to eq('rgba(0, 0, 0, 1)')
end

Then(/^I should see that error text is "([^"]*)"$/) do |size|
  h2 = find_by_id('error').find('h2')
  expect(h2.native.style('font-size')).to eq(size)
end
