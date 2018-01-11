Feature: See list of asteroids
  as a user I want to be able to see list of asteroids

  Scenario: If I open up the navbar and click on the link to see list of asteroids, then it should show list of asteroids
  Given I am on the homepage
  And I open up the navbar
  When I click on list of asteroids
  Then I will be directed to the list of asteroids page
