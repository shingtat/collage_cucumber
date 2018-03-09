Feature: Rectangular shape and all photos contained in the shape.
Background:

Given there is a valid image on the collage page

Scenario: collage appearance
  When collage loads
  Then I should see Rectangular shape and all photos contained in the shape
