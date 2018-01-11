Feature: Edit Star
  as a user I want to be able to edit a star

  Scenario: If I input new details in a current star, I will be redirected to homepage when successful
  Given I am on the homepage
  And I click on the star I want to edit
  And I click on the edit button
  When I input the details
  Then I proceed to submit the star, I will be redirected to the homepage
