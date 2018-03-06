Given(/^I am on the Index Page$/) do
  visit "http://localhost:8080/Implementation/index.html"
end

When(/^html loads$/) do
  find("html")
end

Then(/^I should see gray background color$/) do
  html = page.find("html")
  puts html.native.style('background-color')
  expect(html.native.style('background-color')).to eq('rgba(211, 211, 211, 1)')
end

When(/^input text loads$/) do
  find_by_id("text_input")
end

Then(/^I should see dark gray outline$/) do
  text_input = page.find_by_id("text_input")
  puts text_input.native.style("border-style")
  expect(text_input.native.style('border-style')).to eq('solid')
end
