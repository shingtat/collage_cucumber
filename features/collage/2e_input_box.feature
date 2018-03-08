Feature: Input Box

Background:

	Given I am on the Collage Page

Scenario: input box
  When input box loads
  Then I should see dark gray outline
	Then I should see the Input Box to the left of the Build Another Collage button
  Then I should see the search box with placeholder text "Enter Topic"
  Then I should see Prompt text disappears when user begins typing in a topic
  Then I should see Background color "white"
  Then I should see Pressing enter in the box triggers the build collage process
