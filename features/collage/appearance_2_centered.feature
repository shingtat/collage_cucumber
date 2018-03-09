Feature: Collage centered

Background:

	Given I am on the Collage Page

Scenario: collage appearance
	When collage loads
  Then I should see the Collage centered in the page
