Feature: Collage Page Requirements

Background:

	Given I am on the Collage Page

Scenario: build another collage button
  When build another collage button loads
  Then I should see Button color is "dark gray"
  Then I should see Text color is "white"
  Then I should see Button labeled with text that says "Build Another Collage"

Scenario: input box
  When input box loads
  Then I should see dark gray outline
  Then I should see the search box with placeholder text "Enter Topic"
  Then I should see Prompt text disappears when user begins typing in a topic
  Then I should see Background color "white"
  Then I should see Pressing enter in the box triggers the build collage process

Scenario: export collage button
  When export collage button loads
  Then I should see Clicking button allows the user to download a PNG image of the collage
  Then I should see Size of image should match the displayed collage’s size
  Then I should see Export Collage Button color is "dark gray"
  Then I should see Export Collage Text color is "white"
  Then I should see Export Button labeled with text that says "Export Collage"

Scenario: collage appearance
	When collage loads
	Then I should see Photos should be displayed in the collage with a random rotation of "-45" to "45" degrees
