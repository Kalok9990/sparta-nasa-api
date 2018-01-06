require 'capybara'

class SearchAsteroid
  include Capybara::DSL

  ASTEROID__FIELD_ID = 'asteroid_id' unless const_defined?(:ASTEROID__FIELD_ID)
  SUBMIT_ID = '#submit_button' unless const_defined?(:SUBMIT_ID)
  NEO_TEXT = 'Neo Reference id:' unless const_defined?(:NEO_ID)

  def input_id_field(id)
    fill_in(ASTEROID__FIELD_ID, with: id)
  end

  def find_submit
    find(SUBMIT_ID)
  end

  def click_submit
    find_submit.click
  end

  def success
    find("td", :text => NEO_TEXT)
  end
end
