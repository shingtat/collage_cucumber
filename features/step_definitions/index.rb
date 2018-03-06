Given(/^I am on the Index page$/) do
  visit "http://localhost:8080/Implementation/index.html"
end

When(/^page loads$/) do
  find_field("html")
end

Then(/^I should see gray background$/) do
  expect(page.find('html').style('background-color')).to eq('#d3d3d3')
end
