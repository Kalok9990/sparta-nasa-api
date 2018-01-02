require 'httparty'
require 'json'

class NasaBrowse
  include HTTParty

  base_uri "https://api.nasa.gov/neo/rest/v1/neo"

  def initialize
    @key = "api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
  end

  def get_list
    @browse = JSON.parse(self.class.get("/browse?#{@key}").body)
  end

  def get_link
    @browse["links"]
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

  def get_page
    @browse["page"]
  end

  def get_page_size
    get_page["size"]
  end

  def get_page_element
    get_page["total_elements"]
  end

  def get_page_total
    get_page["total_pages"]
  end

  def get_page_number
    get_page["number"]
  end

  def get_neos
    @browse["near_earth_objects"]
  end

  def neos_link(asteroid)
    asteroid["links"]
  end

  def neos_self(asteroid)
    neos_link(asteroid)["self"]
  end

  def neos_ref_id(asteroid)
    asteroid["neo_reference_id"]
  end

  def neos_name(asteroid)
    asteroid["name"]
  end

  def neos_url(asteroid)
    asteroid["nasa_jpl_url"]
  end

  def neos_abs_magnitude(asteroid)
    asteroid["absolute_magnitude_h"]
  end

  def neos_est_diameter(asteroid)
    asteroid["estimated_diameter"]
  end

  def diameter_km(asteroid)
    neos_est_diameter(asteroid)["kilometers"]
  end

  def diameter_km_min(asteroid)
    diameter_km(asteroid)["estimated_diameter_min"]
  end

  def diameter_km_max(asteroid)
    diameter_km(asteroid)["estimated_diameter_max"]
  end

  def diameter_m(asteroid)
    neos_est_diameter(asteroid)["meters"]
  end

  def diameter_m_min(asteroid)
    diameter_m(asteroid)["estimated_diameter_min"]
  end

  def diameter_m_max(asteroid)
    diameter_m(asteroid)["estimated_diameter_max"]
  end

  def diameter_miles(asteroid)
    neos_est_diameter(asteroid)["miles"]
  end

  def diameter_miles_min(asteroid)
    diameter_miles(asteroid)["estimated_diameter_min"]
  end

  def diameter_miles_max(asteroid)
    diameter_miles(asteroid)["estimated_diameter_max"]
  end

  def diameter_feet(asteroid)
    neos_est_diameter(asteroid)["feet"]
  end

  def diameter_feet_min(asteroid)
    diameter_feet(asteroid)["estimated_diameter_min"]
  end

  def diameter_feet_max(asteroid)
    diameter_feet(asteroid)["estimated_diameter_max"]
  end

  def neos_hazardous(asteroid)
    asteroid["is_potentially_hazardous_asteroid"]
  end

  def neos_close_approach(asteroid)
    asteroid["close_approach_data"]
  end

  def get_date(data)
    data["close_approach_date"]
  end

  def get_epoch(data)
    data["epoch_date_close_approach"]
  end

  def get_velocity(data)
    data["relative_velocity"]
  end

  def get_kms(data)
    get_velocity(data)["kilometers_per_second"]
  end

  def get_kmh(data)
    get_velocity(data)["kilometers_per_hour"]
  end

  def get_mh(data)
    get_velocity(data)["miles_per_hour"]
  end

  def get_miss_distance(data)
    data["miss_distance"]
  end

  def get_astonomical(data)
    get_miss_distance(data)["astronomical"]
  end

  def get_lunar(data)
    get_miss_distance(data)["lunar"]
  end

  def get_km_miss(data)
    get_miss_distance(data)["kilometers"]
  end

  def get_miles_miss(data)
    get_miss_distance(data)["miles"]
  end

  def get_orbit_body(data)
    data["orbiting_body"]
  end

  def get_orbital_data(asteroid)
    asteroid["orbital_data"]
  end

  def get_orbital_id(asteroid)
    get_orbital_data(asteroid)["orbit_id"]
  end

  def get_orbital_date(asteroid)
    get_orbital_data(asteroid)["orbit_determination_date"]
  end

  def get_orbit_uncertainty(asteroid)
    get_orbital_data(asteroid)["orbit_uncertainty"]
  end

  def get_orbit_intersection(asteroid)
    get_orbital_data(asteroid)["minimum_orbit_intersection"]
  end

  def get_orbit_jupiter(asteroid)
    get_orbital_data(asteroid)["jupiter_tisserand_invariant"]
  end

  def get_orbit_epoch(asteroid)
    get_orbital_data(asteroid)["epoch_osculation"]
  end

  def get_orbit_eccentricity(asteroid)
    get_orbital_data(asteroid)["eccentricity"]
  end

  def get_orbit_semi_axis(asteroid)
    get_orbital_data(asteroid)["semi_major_axis"]
  end

  def get_orbit_inclination(asteroid)
    get_orbital_data(asteroid)["inclination"]
  end

  def get_orbit_longitude(asteroid)
    get_orbital_data(asteroid)["ascending_node_longitude"]
  end

  def get_orbit_period(asteroid)
    get_orbital_data(asteroid)["orbital_period"]
  end

  def get_orbit_perihelion_distance(asteroid)
    get_orbital_data(asteroid)["perihelion_distance"]
  end

  def get_orbit_perihelion_argument(asteroid)
    get_orbital_data(asteroid)["perihelion_argument"]
  end

  def get_orbit_aphelion_distance(asteroid)
    get_orbital_data(asteroid)["aphelion_distance"]
  end

  def get_orbit_perihelion_time(asteroid)
    get_orbital_data(asteroid)["perihelion_time"]
  end

  def get_orbit_mean_anomaly(asteroid)
    get_orbital_data(asteroid)["mean_anomaly"]
  end

  def get_orbit_mean_motion(asteroid)
    get_orbital_data(asteroid)["mean_motion"]
  end

  def get_orbit_equinox(asteroid)
    get_orbital_data(asteroid)["equinox"]
  end
end
