Feature: Each photo has a 3 pixel white frame surrounding it
Background:

Given I am on the Collage Page

Scenario: collage appearance
  When collage loads
  Then I should see Each photo has a 3 pixel white frame surrounding it
