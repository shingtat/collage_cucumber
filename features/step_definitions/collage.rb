require_relative 'collage_appearance_helper'
require_relative 'collage_helper'

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

#Collage appearance
When(/^collage loads$/) do
  find_by_id("main_image")
end

Then(/^I should see the average size of the photos (after scaling) shall be 1 out of 20th of the available rectangular space$/) do
  expect(findAverage("size.txt")).to eq(true)
end

Then(/^I should see Photos should be displayed in the collage with a random rotation of "([^"]*)" to "([^"]*)" degrees$/) do |angle1, angle2|
  confirm = angleConfirmation("rotation.txt", angle1.to_i, angle2.to_i)
  expect(confirm).to eq(true)
end
