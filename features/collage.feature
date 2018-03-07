Feature: Collage Page Requirements

Background:

	Given I am on the Collage Page

Scenario: background color

  When html in collage page loads
  Then I should see "white" background color

Scenario: title at top of the page
  When h1 text loads
  Then I should see "black" text
  Then I should see Reads Collage for topic X where "dog" is the topic
  Then I should see font size is at least "24px"

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
