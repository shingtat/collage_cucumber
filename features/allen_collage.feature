Feature: Checking css on collage page

Background:

	Given I am on the Collage page
	Then I should see the search box with placeholder text "Enter Topic"
	And I should see the Title at the top of the page
	And I should see the Collage underneath the Title
	And I should see the Collage centered in the page
	And I should see the Collage meets the width requirements
	And I should see the Collage meets the height requirements
	And I should see the Build Another Collage button underneath the collage
	And I should see the Build Another Collage button right of center
	And I should see the Input Box to the left of the Build Another Collage button
	And I should see the Previous Collage Picker at the bottom of the page


Scenario: search on Collage page

	When I enter "William Halfond" in the search box
	And press search
	Then I should see the title change for "William Halfond"



