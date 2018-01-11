require 'capybara'

class NewStarPage
  include Capybara::DSL

  TITLE_FIELD_ID = 'title_form' unless const_defined?(:TITLE_FIELD_ID)
  INFO_FIELD_ID = 'info_form' unless const_defined?(:INFO_FIELD_ID)
  IMAGE_FIELD_ID = 'image_form' unless const_defined?(:IMAGE_FIELD_ID)
  SUBMIT_BUTTON_ID = 'submit_star' unless const_defined?(:SUBMIT_BUTTON_ID)

  def fill_in_title(title)
    fill_in(TITLE_FIELD_ID, with: title)
  end

  def fill_in_info(info)
    fill_in(INFO_FIELD_ID, with: info)
  end

  def fill_in_image(image_url)
    fill_in(IMAGE_FIELD_ID, with: image_url)
  end

  def click_submit
    find_button(SUBMIT_BUTTON_ID).click
  end
end
