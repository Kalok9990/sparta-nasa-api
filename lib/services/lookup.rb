require 'httparty'
require 'json'

class NasaLookup
  include HTTParty

  base_uri "https://api.nasa.gov/neo/rest/v1/neo"

  def initialize
    @key = "api_key=92KjKXlfAG8eYrh0KhkkRuWKAbIwdEUAsu2wlS5c"
  end

  def asteroid(id)
    @lookup = JSON.parse(self.class.get("/#{id}?#{@key}").body)
  end

  def get_list
    @lookup
  end

  def get_link
    @lookup["links"]
  end

  def get_link_self
    get_link["self"]
  end

  def neos_ref_id
    @lookup["neo_reference_id"]
  end

  def neos_name
    @lookup["name"]
  end

  def neos_url
    @lookup["nasa_jpl_url"]
  end

  def neos_magnitude
    @lookup["absolute_magnitude_h"]
  end

  def neos_est_diameter
    @lookup["estimated_diameter"]
  end

  def diameter_km
    neos_est_diameter["kilometers"]
  end

  def diameter_km_min
    diameter_km["estimated_diameter_min"]
  end

  def diameter_km_max
    diameter_km["estimated_diameter_max"]
  end

  def diameter_m
    neos_est_diameter["meters"]
  end

  def diameter_m_min
    diameter_m["estimated_diameter_min"]
  end

  def diameter_m_max
    diameter_m["estimated_diameter_max"]
  end

  def diameter_miles
    neos_est_diameter["miles"]
  end

  def diameter_miles_min
    diameter_miles["estimated_diameter_min"]
  end

  def diameter_miles_max
    diameter_miles["estimated_diameter_max"]
  end

  def diameter_feet
    neos_est_diameter["feet"]
  end

  def diameter_feet_min
    diameter_feet["estimated_diameter_min"]
  end

  def diameter_feet_max
    diameter_feet["estimated_diameter_max"]
  end

  def neos_hazardous
    @lookup["is_potentially_hazardous_asteroid"]
  end

  def neos_close_approach
    @lookup["close_approach_data"]
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

  def get_astronomical(data)
    get_miss_distance(data)["astronomical"]
  end

  def get_lunar(data)
    get_miss_distance(data)["lunar"]
  end

  def get_km_distance(data)
    get_miss_distance(data)["kilometers"]
  end

  def get_miles_distance(data)
    get_miss_distance(data)["miles"]
  end

  def get_orbiting_body(data)
    data["orbiting_body"]
  end

  def get_orbital_data
    @lookup["orbital_data"]
  end

  def get_orbit_id
    get_orbital_data["orbit_id"]
  end

  def get_orbit_date
    get_orbital_data["orbit_determination_date"]
  end

  def get_orbit_uncertainty
    get_orbital_data["orbit_uncertainty"]
  end

  def get_orbit_intersection
    get_orbital_data["minimum_orbit_intersection"]
  end

  def get_orbit_tisserand
    get_orbital_data["jupiter_tisserand_invariant"]
  end

  def get_orbit_epoch
    get_orbital_data["epoch_osculation"]
  end

  def get_orbit_eccentricity
    get_orbital_data["eccentricity"]
  end

  def get_orbit_major_axis
    get_orbital_data["semi_major_axis"]
  end

  def get_orbit_inclination
    get_orbital_data["inclination"]
  end

  def get_orbit_node_longitude
    get_orbital_data["ascending_node_longitude"]
  end

  def get_orbit_period
    get_orbital_data["orbital_period"]
  end

  def get_perihelion_distance
    get_orbital_data["perihelion_distance"]
  end

  def get_perihelion_argument
    get_orbital_data["perihelion_argument"]
  end

  def get_aphelion_distance
    get_orbital_data["aphelion_distance"]
  end

  def get_perihelion_time
    get_orbital_data["perihelion_time"]
  end

  def get_mean_anomaly
    get_orbital_data["mean_anomaly"]
  end

  def get_mean_motion
    get_orbital_data["mean_motion"]
  end

  def get_orbit_equinox
    get_orbital_data["equinox"]
  end
end
