Feature: New Star
  as a user I want to be able to make a new star

  Scenario: If I input the details I will be redirected back to the homepage
    Given I am on the home page
    And I move to the new form page
    When I input the details
    Then I proceed to submit the star, I will be redirected to the homepage
