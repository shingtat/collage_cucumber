Feature: Collage Page Requirements

Background:

	Given I am on the Collage Page

Scenario: background color

  When html loads
  Then I should see "white" background color
