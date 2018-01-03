require 'httparty'
require 'json'

class NasaFeed
  include HTTParty

  base_uri "https://api.nasa.gov/neo/rest/v1"

  def initialize
    @key = "api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
  end

  def get_list(start_date, end_date)
    @feed = JSON.parse(self.class.get("/feed?start_date=#{start_date}&end_date=#{end_date}&#{@key}").body)
  end

  def list
    @feed
  end

  def get_link
    @feed["links"]
  end

  def get_link_next
    get_link["next"]
  end

  def get_link_self
    get_link["self"]
  end

  def get_link_prev
    get_link["prev"]
  end

  def get_count
    @feed["element_count"]
  end

  def get_neo
    @feed["near_earth_objects"]
  end

  def get_dates
    get_neo.keys
  end

  def get_key_link(object)
    object["links"]
  end

  def get_key_selflink(object)
    get_key_link(object)["self"]
  end

  def get_neo_id(object)
    object["neo_reference_id"]
  end

  def get_name(object)
    object["name"]
  end

  def get_url(object)
    object["nasa_jpl_url"]
  end

  def get_magnitude(object)
    object["absolute_magnitude_h"]
  end

  def get_est_diameter(object)
    object["estimated_diameter"]
  end

  def get_est_diameter_km(object)
    get_est_diameter(object)["kilometers"]
  end

  def get_est_diameter_km_min(object)
    get_est_diameter_km(object)["estimated_diameter_min"]
  end

  def get_est_diameter_km_max(object)
    get_est_diameter_km(object)["estimated_diameter_max"]
  end

  def get_est_diameter_m(object)
    get_est_diameter(object)["meters"]
  end

  def get_est_diameter_m_min(object)
    get_est_diameter_m(object)["estimated_diameter_min"]
  end

  def get_est_diameter_m_max(object)
    get_est_diameter_m(object)["estimated_diameter_max"]
  end

  def get_est_diameter_miles(object)
    get_est_diameter(object)["miles"]
  end

  def get_est_diameter_miles_min(object)
    get_est_diameter_miles(object)["estimated_diameter_min"]
  end

  def get_est_diameter_miles_max(object)
    get_est_diameter_miles(object)["estimated_diameter_max"]
  end

  def get_est_diameter_feet(object)
    get_est_diameter(object)["feet"]
  end

  def get_est_diameter_feet_min(object)
    get_est_diameter_feet(object)["estimated_diameter_min"]
  end

  def get_est_diameter_feet_max(object)
    get_est_diameter_feet(object)["estimated_diameter_max"]
  end

  def get_hazardous(object)
    object["is_potentially_hazardous"]
  end

  def get_approach_data(object)
    object["close_approach_data"]
  end

  def get_approach_date(data)
    data["close_approach_date"]
  end

  def get_epoch_date(data)
    data["epoch_date_close_approach"]
  end

  def get_velocity(data)
    data["relative_velocity"]
  end

  def get_velocity_kms(data)
    get_velocity(data)["kilometers_per_second"]
  end

  def get_velocity_kmh(data)
    get_velocity(data)["kilometers_per_hour"]
  end

  def get_velocity_mh(data)
    get_velocity(data)["miles_per_hour"]
  end

  def get_miss_distance(data)
    data["miss_distance"]
  end

  def get_miss_distance_astronomical(data)
    get_miss_distance(data)["astronomical"]
  end

  def get_miss_distance_lunar(data)
    get_miss_distance(data)["lunar"]
  end

  def get_miss_distance_km(data)
    get_miss_distance(data)["kilometers"]
  end

  def get_miss_distance_miles(data)
    get_miss_distance(data)["miles"]
  end

  def get_orbiting_body(data)
    data["orbiting_body"]
  end
end
