Feature: Search asterid
  as a user I want to be able to search for an asteroid

  Scenario: If I input san asteroid id, it should show me the asteroid details
  Given I am on the homepage
  And I click on the search asteroid link in the navbar
  When I input the asteroid id
  Then I will be directed to the asteroid page
