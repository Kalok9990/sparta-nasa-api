require 'capybara/dsl'

class RootPage
  include Capybara::DSL

  # Page Objects
  HOMEPAGE = ''
  NAV_LINK = ''

  def visit_root_page
    visit(HOMEPAGE)
  end
