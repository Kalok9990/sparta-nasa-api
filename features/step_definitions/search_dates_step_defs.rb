Given("I click on the search dates link in the navbar") do
  navbar.click_navbar
  navbar.click_search_dates_link
end

When("I input the dates") do
  searchdates.input_start_field("2018-01-06")
  searchdates.input_end_field("2018-01-10")
  searchdates.click_submit
end

Then("I will be directed to the correct page") do
  searchdates.success
end
