Feature: Previous Collage Picker Requirements

Background:

	Given there are two history images on the collage page

  Scenario: Single row
  	When I see the history bar
    Then I should see the Previous Collage Picker at the bottom of the page
  	And I should see the Previous Collage Picker does not show collage currently in the main collage space
  	And I should see the Previous Collage Picker displays all collages in a single horizontal row
    Then I should see Previous Collage Picker shows scaled down versions of all previous collages generated in the session by the user
