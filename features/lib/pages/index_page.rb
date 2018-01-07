require 'capybara'

class IndexPage
  include Capybara::DSL

  HOMEPAGE = 'localhost:9292' unless const_defined?(:HOMEPAGE)
  EDIT_STAR_LINK_ID = '1' unless const_defined?(:EDIT_STAR_LINK_ID)
  # will need to change delete id
  DELETE_STAR_LINK_ID = '18' unless const_defined?(:DELETE_STAR_LINK_ID)

  def visit_home_page
    visit(HOMEPAGE)
  end

  def click_star
    click_link(EDIT_STAR_LINK_ID)
  end

  def click_delete_star
    click_link(DELETE_STAR_LINK_ID)
  end

  def success
    find(:xpath, ".//h1").text
  end
end
