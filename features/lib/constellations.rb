require_relative '../lib/pages/search_asteroid_page'
require_relative '../lib/pages/index_page'
require_relative '../lib/pages/navbar_page'
require_relative '../lib/pages/new_star_page'
require_relative '../lib/pages/show_page'
require_relative '../lib/pages/all_asteroids_page'
require_relative '../lib/pages/dates_page'

module Constellations

  def indexpage
    IndexPage.new
  end

  def navbar
    NavBar.new
  end

  def newpage
    NewStarPage.new
  end

  def showpage
    ShowPage.new
  end

  def all_asteroids
    AllAsteroids.new
  end

  def searchdates
    SearchDates.new
  end

  def searchasteroid
    SearchAsteroid.new
  end
end
