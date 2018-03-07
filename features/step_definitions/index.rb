Given(/^I am on the Index Page$/) do
  visit "http://localhost:8080/Implementation/index.html"
end

#Testing for White Background
When(/^html loads$/) do
  find("html")
end

Then(/^I should see gray background color$/) do
  html = page.find("html")
  puts html.native.style('background-color')
  expect(html.native.style('background-color')).to eq('rgba(211, 211, 211, 1)')
end

#Testing for Input Text Box
When(/^input text loads$/) do
  find_by_id("text_input")
end

Then(/^I should see dark gray outline$/) do
  text_input = page.find_by_id("text_input")
  puts text_input.native.style("border-style")
  expect(text_input.native.style('border-style')).to eq('solid')
end

Then(/^I should see centered in the middle of the page$/) do
  text_div = page.find_by_id("input")
  text_div[:class].include?("centered")
end

Then(/^I should see the search box with placeholder text "([^"]*)"$/) do |placeholdertext|
  expect(find_field('text_input')['placeholder']).to eq placeholdertext
end

#This is a scoping problem and something your browser knows how to handle.
#You should not test your browser's ability to interpret placeholder and show it.
Then(/^I should see Prompt text disappears when user begins typing in a topic$/) do
  expect(find_field('text_input')['placeholder']).to eq ("Enter Topic")
end

Then(/^I should see Background color "([^"]*)"$/) do |color|
  text_input = page.find_by_id("text_input")
  expect(text_input.native.style('background-color')).to eq('rgba(255, 255, 255, 1)')
end

#Testing for Build Collage button
When(/^build collage button loads$/) do
  find_by_id("text_input")
end

Then(/^I should see Button labeled with text that says "([^"]*)"$/) do |text|
  build_button = page.find_by_id("build")
  expect(build_button.text).to eq(text)
end

Then(/^I should see Text color is "([^"]*)"$/) do |color|
  build_button = page.find_by_id("build")
  expect(build_button.native.style('color')).to eq('rgba(255, 255, 255, 1)')
end

Then(/^I should see Button color is "([^"]*)"$/) do |color|
  build_button = page.find_by_id("build")
  expect(build_button.native.style('background-color')).to eq('rgba(102, 102, 102, 1)')
end
