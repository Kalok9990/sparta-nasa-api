class AllAsteroids
  include Capybara::DSL

  def success
    find(:xpath, ".//th")
  end
end
