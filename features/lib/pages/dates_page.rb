require 'capybara'

class SearchDates
  include Capybara::DSL

  START_DATE_FIELD_ID = 'start_date' unless const_defined?(:START_DATE_FIELD_ID)
  END_DATE_FIELD_ID = 'end_date' unless const_defined?(:END_DATE_FIELD_ID)
  SUBMIT_ID = '#submit' unless const_defined?(:SUBMIT_ID)
  ELEMENT_COUNT_ID = '#element_count' unless const_defined?(:ELEMENT_COUNT_ID)

  def input_start_field(date)
    fill_in(START_DATE_FIELD_ID, with: date)
  end

  def input_end_field(date)
    fill_in(END_DATE_FIELD_ID, with: date)
  end

  def find_submit
    find(SUBMIT_ID)
  end

  def click_submit
    find_submit.click
  end

  def success
    find(ELEMENT_COUNT_ID)
  end
end
