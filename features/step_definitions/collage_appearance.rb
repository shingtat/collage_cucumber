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
