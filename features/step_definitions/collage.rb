#Testing for White Background
When(/^html loads$/) do
  find("html")
end

Then(/^I should see gray background color$/) do
  html = page.find("html")
  puts html.native.style('background-color')
  expect(html.native.style('background-color')).to eq('rgba(255, 255, 255, 1)')
end
