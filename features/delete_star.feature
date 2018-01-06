Feature: Delete Star
  as a user I want to be able to delete a star

  Scenario: If I click on the star I want to delete and click on delete, it should delete the star
  Given I am on the homepage
  And I click on the star I want to delete
  When I click on delete
  Then I will be redirected to the homepage
