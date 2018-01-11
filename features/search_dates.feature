Feature: Search asterids between dates
  as a user I want to be able to search for asteroids between dates

  Scenario: If I input start date and end date, it should show me a list of asteroids between those dates
  Given I am on the homepage
  And I click on the search dates link in the navbar
  When I input the dates
  Then I will be directed to the correct page
