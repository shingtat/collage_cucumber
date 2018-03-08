Feature: checking requirements for history bar
	
Background:
	Given I am on the Collage Page

Scenario: Single row
	When I see the history bar
	Then I should see Previous Collage Picker shows scaled down versions of all previous collages generated in the session by the user
	And I should see the Previous Collage Picker does not show collage currently in the main collage space
	And I should see the Previous Collage Picker displays all collages in a single horizontal row