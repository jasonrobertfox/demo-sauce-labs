#dimensions.feature
Feature: Show a building's dimensions to the user
  In order to learn about the worlds buildings
  As an architecture geek
  I want to view basic building dimensions

  @demo1
  Scenario: I can see available buildings
    Given I am on homepage
    Then I should see "Freedom Tower"
    And I should see "Burj Khalifa"

  @demo1
  Scenario: I can view a building's top floor
    Given I am on homepage
    And I follow "Freedom Tower"
    Then I should see "Freedom Tower"
    And I should not see "Burj Khalifa"
    And I should see "Top Floor: 1268 ft"

  @demo1
  Scenario: I can view a different building's tip height
    Given I am on homepage
    And I follow "Burj Khalifa"
    Then I should not see "Freedom Tower"
    And I should see "Burj Khalifa"
    And I should see "Tip: 2722 ft"
