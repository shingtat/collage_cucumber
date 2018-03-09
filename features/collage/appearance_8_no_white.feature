Feature: No white (empty) space should be present in the collage
Background:

Given I am on the Collage Page

Scenario: collage appearance
  When collage loads
  Then I should see No white (empty) space should be present in the collage
