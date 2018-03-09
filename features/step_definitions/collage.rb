require_relative 'functions/collage_appearance_helper'
require_relative 'functions/collage_helper'
require_relative 'functions/collage_history_helper'

Given(/^I am on the Collage Page$/) do
  visit "http://localhost:8080/Implementation/collage.html"
end

#Testing for White Background
When(/^html in collage page loads$/) do
  find("html")
end

Then(/^I should see "([^"]*)" background color$/) do |color|
  html = page.find("html")
  puts html.native.style('background-color')
  expect(html.native.style('background-color')).to eq('rgba(255, 255, 255, 1)')
end

#Testing for h1 title at the top of the Page
When(/^h1 text loads$/) do
  find_by_id("topic")
end

#Black text
Then(/^I should see "([^"]*)" text$/) do |color|
  title = page.find_by_id("topic")
  puts title.native.style('color')
  expect(title.native.style('color')).to eq('rgba(0, 0, 0, 1)')
end

Then(/^I should see Reads Collage for topic X where "([^"]*)" is the topic$/) do |arg1|
  visit "http://localhost:8080/Implementation/index.html"
  text_input = find_by_id("text_input")
  fill_in('text_input', :with => arg1)
  click_button("build")
  find_by_id('history')
  url = URI.parse(current_url)
  params = CGI.parse(url.query)
  topic = params['topic'][0]
  expect(topic).to eq(arg1)
end

#Font size is at least 24px
Then(/^I should see font size is at least "([^"]*)"$/) do |size|
  title = page.find_by_id("topic")
  expect(title.native.style('font-size')).to eq("26px")
end

#Testing for Collage appears underneath the Title
Then(/^I should see the Collage underneath the Title$/) do
	posTopic = topic_bot()

	posImage = image_top()

	# NEED TO CHECK FOR BUILD ANOTHER BUTTON

	# posInput = input_top()

	# posHistory = history_top()

	expect(posImage).to be > posTopic
	# expect(posImage).to be < posInput
	# expect(posImage).to be < posHistory
end

#Testing for Build Another Collage button
When(/^build another collage button loads$/) do
  find_by_id("build")
end

Then(/^I should see the Build Another Collage button underneath the collage$/) do
	posImage = image_bot()
	posBuild = build_top()

	expect(posBuild).to be > posImage
end

Then(/^I should see the Build Another Collage button right of center$/) do
	buildLeft = build_left()

	width = page.driver.browser.manage.window.size[0]

	expect(buildLeft).to be > width/2
end

#Testing for Input Box in Collage page
When(/^input box loads$/) do
  find_by_id("text_input")
end

Then(/^I should see the Input Box to the left of the Build Another Collage button$/) do
	posInput = input_right()
	posBuild = build_left()

	expect(posInput).to be < posBuild
end

#Testing for Export Collage button in Collage page
When(/^export collage button loads$/) do
  find_by_id("export")
end

#Clicking button allows the user to download a PNG image of the collage
Then(/^I should see Clicking button allows the user to download a PNG image of the collage$/) do
  click_button("export")
  sleep(5)
  expect(File.exist?('/Users/Master/Downloads/downloadedCollage1.png')).to eq(true)
end

#Size of image should match the displayed collage’s size
# Then(/^I should see Size of image should match the displayed collage’s size$/) do
#   num = File.open('byte.txt').read
#   expect(num.to_i).to eq(fileSize('/Users/Master/Downloads/downloadedCollage1.png'))
# end

Then(/^I should see Export Collage Button color is "([^"]*)"$/) do |color|
  export = page.find_by_id("export")
  expect(export.native.style('background-color')).to eq('rgba(102, 102, 102, 1)')
end

Then(/^I should see Export Collage Text color is "([^"]*)"$/) do |color|
  export = page.find_by_id("export")
  puts export.native.style('color')
  expect(export.native.style('color')).to eq('rgba(255, 255, 255, 1)')
end

Then(/^I should see Export Button labeled with text that says "([^"]*)"$/) do |text|
  export = page.find_by_id("export")
  expect(export.text).to eq(text)
end

Given(/^there are two history images on the collage page$/) do
  visit "http://localhost:8080/Implementation/index.html"
  fill_in('text_input', :with => "cat")
  click_button('build')
  sleep(12)
  fill_in('text_input', :with => "dog")
  click_button('build')
  sleep(12)
  fill_in('text_input', :with => "dolphin")
  click_button('build')
  sleep(12)
end

When(/^I see the history bar$/) do
	expect(page.find_by_id('history')).to be_truthy
end

Then(/^I should see the Previous Collage Picker at the bottom of the page$/) do
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

# Then(/^I should see Previous Collage Picker shows scaled down versions of all previous collages generated in the session by the user$/) do
# 	prevImages = read_file("/Users/allenhuang/Desktop/send/imageLogs.txt")
# 	thumbnails = get_history()
# 	mainImageSize = get_main_image()
# 	#verify all previous collages are present
# 	thumbnails.each do |thumbnail|
# 		expect(prevImages).to include thumbnail['src']
# 		thumbSize = get_image_size(thumbnail)
# 		expect(mainImageSize[0]).to be > thumbSize[0]
# 		expect(mainImageSize[1]).to be > thumbSize[1]
# 	end
#
# end

And(/^I should see the Previous Collage Picker does not show collage currently in the main collage space$/) do
	thumbnails = get_history()
	thumbnails.each do |ele|
		#checks if the element in the history bar is the same picture as main_image
		if ele['src'].eql? page.find_by_id('main_image')['src']
			#this element must not be displayed
			expect(ele.css_value('display')).to eq "none"
		end
	end
end

And(/^I should see the Previous Collage Picker displays all collages in a single horizontal row$/) do
	thumbnails = get_history()
	tops = []
	bots = []
	thumbnails.each do |ele|
		if not ele.css_value('display').eql? "none" #ele is being
			tops << get_image_pos(ele)[0]
			bots << get_image_pos(ele)[1]
		end
	end
	expect(tops.same_values?).to be true
	expect(bots.same_values?).to be true
end
