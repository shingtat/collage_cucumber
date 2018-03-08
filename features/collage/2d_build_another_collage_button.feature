Feature: Build Another Collage button

Background:

	Given I am on the Collage Page

Scenario: build another collage button
  When build another collage button loads
  Then I should see the Build Another Collage button underneath the collage
  Then I should see the Build Another Collage button right of center
  Then I should see Button color is "dark gray"
  Then I should see Text color is "white"
  Then I should see Button labeled with text that says "Build Another Collage"
