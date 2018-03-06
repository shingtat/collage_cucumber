@index.rb
Feature: Index Page Requirements

Background:

	Given I am on the Index Page

Scenario: background color

  When html loads
  Then I should see gray background color

Scenario: input text
  When input text loads
  Then I should see dark gray outline
