Feature: Rectangular shape and all photos contained in the shape.
Background:

Given I am on the Collage Page

Scenario: collage appearance
  When collage loads
  Then I should see Rectangular shape and all photos contained in the shape
