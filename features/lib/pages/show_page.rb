require 'capybara'

class ShowPage
  include Capybara::DSL

  EDIT_BUTTON_ID = '#edit_button' unless const_defined?(:EDIT_BUTTON_ID)
  DELETE_BUTTON_ID = '#delete_button' unless const_defined?(:DELETE_BUTTON_ID)

  def find_edit
    find(EDIT_BUTTON_ID)
  end

  def click_edit
    find_edit.click
  end

  def find_delete
    find(DELETE_BUTTON_ID)
  end

  def click_delete
    find_delete.click
  end
end
