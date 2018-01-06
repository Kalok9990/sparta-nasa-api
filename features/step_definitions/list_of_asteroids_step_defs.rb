And("I open up the navbar") do
  navbar.click_navbar
end

When("I click on list of asteroids") do
  navbar.click_all_asterpods_link
end

Then("I will be directed to the list of asteroids page") do
  all_asteroids.success
end
