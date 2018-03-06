@index.rb
Feature: Index Page Requirements

Background:

	Given I am on the Index Page

Scenario: background color

  When page loads
  Then I should see gray background color
