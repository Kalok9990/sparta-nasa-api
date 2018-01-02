require_relative 'services/browse'
require_relative 'services/feed'
require_relative 'services/lookup'

class Nasaios

  def browse
    NasaBrowse.new
  end

  def feed
    NasaFeed.new
  end

  def lookup
    NasaLookup.new
  end
end
