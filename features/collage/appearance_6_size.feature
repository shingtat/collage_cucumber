Feature: All photos are scaled to fit within the space allocated for the collage, the average size of
the photos (after scaling) shall be 1/20 of the available rectangular space

Background:

	Given I am on the Collage Page

Scenario: collage appearance
	When collage loads
  Then I should see the average size of the photos (after scaling) shall be 1 out of 20th of the available rectangular space
