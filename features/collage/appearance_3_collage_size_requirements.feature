Feature: The size of the collage must be between 40 and 70% of the browser viewport width, but
not less than 800 pixels; and the height must be between 35 and 50% of the browser
viewport height, but not less than 600 pixels.

Background:

	Given I am on the Collage Page

Scenario: collage appearance
	When collage loads
  Then I should see the Collage meets the width requirements
  Then I should see the Collage meets the height requirements
