require 'spec_helper'

describe Nasaios do

  context 'requesting information on all asteroids through browse' do

    before(:all) do
      @nasa_lookup = Nasaios.new.lookup
      @nasa_lookup.asteroid("3542519")
    end

    it "should respond to a Hash" do
      expect(@nasa_lookup.get_list).to be_kind_of(Hash)
    end

    it "should respond with links as a Hash" do
      expect(@nasa_lookup.get_link).to be_kind_of(Hash)
    end

    it "should respond with a self link as a string" do
      expect(@nasa_lookup.get_link_self).to be_kind_of(String)
    end

    it "should respond with a neo reference id as a string" do
      expect(@nasa_lookup.neos_ref_id).to be_kind_of(String)
    end

    it "should respond with a name as a string" do
      expect(@nasa_lookup.neos_name).to be_kind_of(String)
    end

    it "should respond with a nasa jpl url as a string" do
      expect(@nasa_lookup.neos_url).to be_kind_of(String)
    end

    it "should respond with an absolute magnitude as a float" do
      expect(@nasa_lookup.neos_magnitude).to be_kind_of(Float)
    end

    it "should respond with an estimated diameter as a Hash" do
      expect(@nasa_lookup.neos_est_diameter).to be_kind_of(Hash)
    end

    it "should respond with an estimated diameter in kilometers as a Hash" do
      expect(@nasa_lookup.diameter_km).to be_kind_of(Hash)
    end

    it "should respond with an estimated diameter in kilometers minimum as a float" do
      expect(@nasa_lookup.diameter_km_min).to be_kind_of(Float)
    end

    it "should respond with an estimated diameter in kilometers maximum as a float" do
      expect(@nasa_lookup.diameter_km_max).to be_kind_of(Float)
    end

    it "should respond with an estimated diameter in meters as a Hash" do
      expect(@nasa_lookup.diameter_m).to be_kind_of(Hash)
    end

    it "should respond with an estimated diameter in meters minimum as a float" do
      expect(@nasa_lookup.diameter_m_min).to be_kind_of(Float)
    end

    it "should respond with an estimated diameter in meters maximum as a float" do
      expect(@nasa_lookup.diameter_m_max).to be_kind_of(Float)
    end

    it "should respond with an estimated diameter in miles as a Hash" do
      expect(@nasa_lookup.diameter_miles).to be_kind_of(Hash)
    end

    it "should respond with an estimated diameter in miles minimum as a float" do
      expect(@nasa_lookup.diameter_miles_min).to be_kind_of(Float)
    end

    it "should respond with an estimated diameter in miles maximum as a float" do
      expect(@nasa_lookup.diameter_miles_max).to be_kind_of(Float)
    end

    it "should respond with an estimated diameter in feet as a Hash" do
      expect(@nasa_lookup.diameter_feet).to be_kind_of(Hash)
    end

    it "should respond with an estimated diameter in feet minimum as a float" do
      expect(@nasa_lookup.diameter_feet_min).to be_kind_of(Float)
    end

    it "should respond with an estimated diameter in feet maximum as a float" do
      expect(@nasa_lookup.diameter_feet_max).to be_kind_of(Float)
    end

    it "should respond with hazardous asteroid as a string" do
      expect(@nasa_lookup.neos_hazardous).to be_truthy.or be_falsey
    end

    it "should respond with close approach data as an array" do
      expect(@nasa_lookup.neos_close_approach).to be_kind_of(Array)
    end

    it "should respond with a close approach date in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_date(data)).to be_kind_of(String)
      end
    end

    it "should respond with a epoch date close approach in the array as an integer" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_epoch(data)).to be_kind_of(Integer)
      end
    end

    it "should respond with a relative velocity in the array as a Hash" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_velocity(data)).to be_kind_of(Hash)
      end
    end

    it "should respond with a relative velocity kms in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_kms(data)).to be_kind_of(String)
      end
    end

    it "should respond with a relative velocity kmh in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_kmh(data)).to be_kind_of(String)
      end
    end

    it "should respond with a relative velocity miles per hour in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_mh(data)).to be_kind_of(String)
      end
    end

    it "should respond with a miss distance in the array as a Hash" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_miss_distance(data)).to be_kind_of(Hash)
      end
    end

    it "should respond with an astronomical miss distance in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_astronomical(data)).to be_kind_of(String)
      end
    end

    it "should respond with a lunar miss distance in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_lunar(data)).to be_kind_of(String)
      end
    end

    it "should respond with a kilometer miss distance in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_km_distance(data)).to be_kind_of(String)
      end
    end

    it "should respond with a miles miss distance in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_miles_distance(data)).to be_kind_of(String)
      end
    end

    it "should respond with an orbiting body in the array as a string" do
      @nasa_lookup.neos_close_approach.each do |data|
        expect(@nasa_lookup.get_orbiting_body(data)).to be_kind_of(String)
      end
    end

    it "should have orbital data as a Hash" do
      expect(@nasa_lookup.get_orbital_data).to be_kind_of(Hash)
    end

    it "should have an orbit id as a string" do
      expect(@nasa_lookup.get_orbit_id).to be_kind_of(String)
    end

    it "should have an orbit determination date as a string" do
      expect(@nasa_lookup.get_orbit_date).to be_kind_of(String)
    end

    it "should have an orbit uncertainty as a string" do
      expect(@nasa_lookup.get_orbit_uncertainty).to be_kind_of(String)
    end

    it "should have a minimum orbit intersection as a string" do
      expect(@nasa_lookup.get_orbit_intersection).to be_kind_of(String)
    end

    it "should have a jupiter tisserand invariant as a string" do
      expect(@nasa_lookup.get_orbit_tisserand).to be_kind_of(String)
    end

    it "should have an epoch osculation as a string" do
      expect(@nasa_lookup.get_orbit_epoch).to be_kind_of(String)
    end

    it "should have an eccentricity as a string" do
      expect(@nasa_lookup.get_orbit_eccentricity).to be_kind_of(String)
    end

    it "should have a semi major axis as a string" do
      expect(@nasa_lookup.get_orbit_major_axis).to be_kind_of(String)
    end

    it "should have an inclinationa as a string" do
      expect(@nasa_lookup.get_orbit_inclination).to be_kind_of(String)
    end

    it "should have an ascending node longitude as a string" do
      expect(@nasa_lookup.get_orbit_node_longitude).to be_kind_of(String)
    end

    it "should have an orbital period as a string" do
      expect(@nasa_lookup.get_orbit_period).to be_kind_of(String)
    end

    it "should have a perihelion distance as a string" do
      expect(@nasa_lookup.get_perihelion_distance).to be_kind_of(String)
    end

    it "should have a perihelion argument as a string" do
      expect(@nasa_lookup.get_perihelion_argument).to be_kind_of(String)
    end

    it "should have an aphelion distance as a string" do
      expect(@nasa_lookup.get_aphelion_distance).to be_kind_of(String)
    end

    it "should have a perihelion time as a string" do
      expect(@nasa_lookup.get_perihelion_time).to be_kind_of(String)
    end

    it "should have a mean anomaly as a string" do
      expect(@nasa_lookup.get_mean_anomaly).to be_kind_of(String)
    end

    it "should have a mean motion as a string" do
      expect(@nasa_lookup.get_mean_motion).to be_kind_of(String)
    end

    it "should have an equinox as a string" do
      expect(@nasa_lookup.get_orbit_equinox).to be_kind_of(String)
    end
  end
end
