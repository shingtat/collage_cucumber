Feature: Export Collage Button

Background:

	Given I am on the Collage Page

Scenario: export collage button
  When export collage button loads
  Then I should see Clicking button allows the user to download a PNG image of the collage
  Then I should see Size of image should match the displayed collage’s size
  Then I should see Export Collage Button color is "dark gray"
  Then I should see Export Collage Text color is "white"
  Then I should see Export Button labeled with text that says "Export Collage"
