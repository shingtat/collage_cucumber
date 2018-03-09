Feature: Collage Page Requirements

Background:

	Given I am on the Collage Page

Scenario: collage appearance
	When collage loads
	Then I should see Photos should be displayed in the collage with a random rotation of "-45" to "45" degrees
