Given("I click on the search asteroid link in the navbar") do
  navbar.click_navbar
  navbar.click_search_asteroids_link
end

When("I input the asteroid id") do
  searchasteroid.input_id_field("2021277")
  searchasteroid.click_submit
end

Then("I will be directed to the asteroid page") do
  searchasteroid.success
end
