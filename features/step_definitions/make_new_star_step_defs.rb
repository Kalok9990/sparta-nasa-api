Given("I am on the home page") do
  indexpage.visit_home_page
end

And("I move to the new form page") do
  navbar.click_navbar
  navbar.click_new_star_link
end

When("I input the details") do
  newpage.fill_in_title("Cancer")
  newpage.fill_in_info("One of the 12 Zodiacs, with a star shape of a crab")
  newpage.fill_in_image("https://cdn.thinglink.me/api/image/711408163395469314/1240/10/scaletowidth")
end

Then("I proceed to submit the star, I will be redirected to the homepage") do
  newpage.click_submit
  indexpage.success
end
