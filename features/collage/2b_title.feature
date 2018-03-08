Feature: Title at the top of the page

Background:

	Given I am on the Collage Page

Scenario: title at top of the page
  When h1 text loads
  Then I should see "black" text
  Then I should see Reads Collage for topic X where "cat" is the topic
  Then I should see font size is at least "24px"
