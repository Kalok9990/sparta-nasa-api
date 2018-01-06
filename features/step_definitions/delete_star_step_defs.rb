Given("I click on the star I want to delete") do
  indexpage.click_delete_star
end

When("I click on delete") do
  showpage.click_delete
end

Then("I will be redirected to the homepage") do
  indexpage.success
end
