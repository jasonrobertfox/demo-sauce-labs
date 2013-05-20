#metric.feature
Feature: Toggle between standard and metric system
  In order to understand the dimensions of a building
  As a metric system user
  I want to toggle between dimension systems

  @demo2
  Scenario: There is a toggle button
    Given I am on "/building/freedom-tower"
    Then I should see "Switch to Metric"

  @demo2 @selenium
  Scenario: Clicking on the toggle button will switch dimensions
    Given I am on "/building/freedom-tower"
    When I follow "Switch to Metric"
    Then I should see "Top Floor: 386.4864 m"
    And I should see "Tip: 541.3248 m"

  @demo2 @selenium
  Scenario: Clicking on the toggle button twice should show me the original dimensions
    Given I am on "/building/freedom-tower"
    When I follow "Switch to Metric"
    And I follow "Switch to Standard"
    Then I should see "Top Floor: 1268 ft"
    And I should see "Tip: 1776 ft"
