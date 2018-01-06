require 'capybara'

class NavBar
  include Capybara::DSL

  NAVBAR = '#openNav' unless const_defined?(:NAVBAR)
  CLOSE_NAVBAR = '#x_button' unless const_defined?(:CLOSE_NAVBAR)
  ALL_STARS_LINK_TEXT = 'Stars' unless const_defined?(:ALL_STARS_LINK_TEXT)
  NEW_STAR_LINK_TEXT = 'New Star' unless const_defined?(:NEW_STAR_LINK_TEXT)
  ALL_ASTEROIDS_LINK_TEXT = 'List of asteroids' unless const_defined?(:ALL_ASTEROIDS_LINK_TEXT)
  SEARCH_DATES_LINK_TEXT = 'Search between dates' unless const_defined?(:SEARCH_DATES_LINK_TEXT)
  SEARCH_ASTEROID_LINK_TEXT = 'Search asteroid' unless const_defined?(:SEARCH_ASTEROID_LINK_TEXT)

  def find_navbar
    find(NAVBAR)
  end

  def click_navbar
    find_navbar.click
  end

  def click_stars_link
    click_link(ALL_STARS_LINK_TEXT)
  end

  def click_new_star_link
    click_link(NEW_STAR_LINK_TEXT)
  end

  def click_all_asterpods_link
    click_link(ALL_ASTEROIDS_LINK_TEXT)
  end

  def click_search_dates_link
    click_link(SEARCH_DATES_LINK_TEXT)
  end

  def click_search_asteroids_link
    click_link(SEARCH_ASTEROID_LINK_TEXT)
  end

  def find_close_navbar
    find(CLOSE_NAVBAR)
  end

  def click_close_navbar
    find_close_navbar.click
  end
end
