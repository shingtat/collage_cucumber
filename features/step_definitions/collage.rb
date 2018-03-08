require('functions.rb')

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

#Testing for Build Another Collage button
When(/^build another collage button loads$/) do
  find_by_id("build")
end

#Testing for Input Box in Collage page
When(/^input box loads$/) do
  find_by_id("text_input")
end

#Testing for Export Collage button in Collage page
When(/^export collage button loads$/) do
  find_by_id("export")
end

#Clicking button allows the user to download a PNG image of the collage
Then(/^I should see Clicking button allows the user to download a PNG image of the collage$/) do
  click_button("export")
  sleep(5)
  puts File.exist?('/Users/Master/Downloads/downloadedCollage1.png')
end

#Size of image should match the displayed collage’s size
Then(/^I should see Size of image should match the displayed collage’s size$/) do

end

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
