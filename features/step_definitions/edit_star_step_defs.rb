Given("I am on the homepage") do
  indexpage.visit_home_page
end

And("I click on the star I want to edit") do
  indexpage.click_star
end

And("I click on the edit button") do
  showpage.click_edit
end
