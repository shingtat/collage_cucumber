Feature: Less than 30 images found
Background:

	Given error shown

Scenario: insufficient error
	Then I should see that "Insufficient number of images found" should be returned to the user in the main collage space
  Then I should see that error text color is "black"
  Then I should see that error text is "18px"
