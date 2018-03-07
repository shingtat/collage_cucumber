Feature: Collage Page Requirements

Background:

	Given I am on the Collage Page

Scenario: background color

  When html in collage page loads
  Then I should see "white" background color

Scenario: title at top of the page
  When h1 text loads
  Then I should see "black" text
  Then I should see Reads Collage for topic X where "dog" is the topic
  Then I should see font size is at least "24px"
