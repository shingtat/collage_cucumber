Feature: Page background is White

Background:

	Given I am on the Collage Page

  Scenario: background color

    When html in collage page loads
    Then I should see "white" background color
