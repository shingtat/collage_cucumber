Feature: Index Page Requirements

Background:

	Given I am on the Index Page

Scenario: background color

  When html loads
  Then I should see gray background color

Scenario: input text
  When input text loads
  Then I should see dark gray outline
  Then I should see centered in the middle of the page
  Then I should see the search box with placeholder text "Enter Topic"
  Then I should see Prompt text disappears when user begins typing in a topic
  Then I should see Background color "white"
  Then I should see Pressing enter in the box triggers the build collage process  
  
Scenario: build collage button
  Given I am on the Index Page
  When build collage button loads
  Then I should see Button labeled with text that says "Build Collage"
  Then I should see Text color is "white"
  Then I should see Button color is "dark gray"
  Then I should see the Build Collage button to the right of the box
  Then I should see Button cannot be pressed unless the user has entered text in the input box
  Then I should see Pressing the button triggers the building of the collage
