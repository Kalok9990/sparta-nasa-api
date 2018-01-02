require 'spec_helper'

describe Nasaios do

  context 'requesting information on all asteroids through browse' do

    before(:all) do
      @nasa_browse = Nasaios.new.browse
    end

    it "should respond to a Hash" do
      expect(@nasa_browse.get_list).to be_kind_of(Hash)
    end

    it "should respond with links as a Hash" do
      expect(@nasa_browse.get_link).to be_kind_of(Hash)
    end

    it "should respond with a next link as a string or nil" do
      expect(@nasa_browse.get_link_next).to be_kind_of(String).or be_nil
    end

    it "should respond with a self link as a string" do
      expect(@nasa_browse.get_link_self).to be_kind_of(String)
    end

    it "should respond with a prev link as a string or nil" do
      expect(@nasa_browse.get_link_self).to be_kind_of(String).or be_nil
    end

    it "should respond with a page section as a Hash" do
      expect(@nasa_browse.get_page).to be_kind_of(Hash)
    end

    it "should respond with a size as an Integer" do
      expect(@nasa_browse.get_page_size).to be_kind_of(Integer)
    end

    it "should respond with a total elements section as an Integer" do
      expect(@nasa_browse.get_page_element).to be_kind_of(Integer)
    end

    it "should respond with a total pages section as an Integer" do
      expect(@nasa_browse.get_page_total).to be_kind_of(Integer)
    end

    it "should respond with a number as an Integer" do
      expect(@nasa_browse.get_page_number).to be_kind_of(Integer)
    end

    it "should respond with near earth objects as an Array" do
      expect(@nasa_browse.get_neos).to be_kind_of(Array)
    end

    it "should respond within the array with a link as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_link(asteroid)).to be_kind_of(Hash)
      end
    end

    it "should respond within the array link with a self section as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_self(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond within the array with a neo reference id as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_ref_id(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond within the array with a name as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_name(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond within the array with a nasa jpl url as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_url(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond within the array with an absolute magnitude as a Float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_abs_magnitude(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond within the array with an estimated diameter as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_est_diameter(asteroid)).to be_kind_of(Hash)
      end
    end

    it "should respond with an estimated diameter in kilometers as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_km(asteroid)).to be_kind_of(Hash)
      end
    end

    it "should respond with an estimated diameter in kilometers minimum as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_km_min(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond with an estimated diameter in kilometers maximum as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_km_max(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond with an estimated diameter in meters as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_m(asteroid)).to be_kind_of(Hash)
      end
    end

    it "should respond with an estimated diameter in meters minimum as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_m_min(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond with an estimated diameter in meters maximum as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_m_max(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond with an estimated diameter in miles as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_miles(asteroid)).to be_kind_of(Hash)
      end
    end

    it "should respond with an estimated diameter in miles minimum as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_miles_min(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond with an estimated diameter in miles maximum as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_miles_max(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond with an estimated diameter in feet as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_feet(asteroid)).to be_kind_of(Hash)
      end
    end

    it "should respond with an estimated diameter in feet minimum as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_feet_min(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond with an estimated diameter in feet maximum as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.diameter_feet_max(asteroid)).to be_kind_of(Float)
      end
    end

    it "should respond within the array with hazardous asteroid as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_hazardous(asteroid)).to be_truthy.or be_falsey
      end
    end

    it "should respond within the array with close approach data as an array" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.neos_close_aproach(asteroid)).to be_kind_of(Array)
      end
    end

    it "should respond with a close approach date in the array as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_date(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with an epoch close approach date in the array as an Integer" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_epoch(data)).to be_kind_of(Integer)
        end
      end
    end

    it "should respond with a relative velocity in the array as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_velocity(data)).to be_kind_of(Hash)
        end
      end
    end

    it "should respond with kms in relative velocity in the array as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_kms(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with kmh in relative velocity in the array as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_kmh(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with miles per hour in relative velocity in the array as a float" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_mh(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with a miss distance in the array as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_miss_distance(data)).to be_kind_of(Hash)
        end
      end
    end

    it "should respond with an astronomical miss distance in the array as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_astonomical(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with a lunar miss distance in the array as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_lunar(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with a kilometers miss distance in the array as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_km_miss(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with a miles miss distance in the array as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_miles_miss(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with a orbiting body in the array as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        @nasa_browse.neos_close_aproach(asteroid).each do |data|
          expect(@nasa_browse.get_orbit_body(data)).to be_kind_of(String)
        end
      end
    end

    it "should respond with orbital data as a Hash" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbital_data(asteroid)).to be_kind_of(Hash)
      end
    end

    it "should respond with orbit id in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbital_id(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with orbit determination date in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbital_date(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with orbit uncertainty in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_uncertainty(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with minimum orbit intersection in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_intersection(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with jupiter tisserand invariant in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_jupiter(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with epoch osculation in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_epoch(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with eccentricity in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_eccentricity(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with semi major axis in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_semi_axis(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with inclination in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_inclination(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with ascending node longitude in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_longitude(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with orbital period in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_period(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with perihelion distance in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_perihelion_distance(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with perihelion argument in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_perihelion_argument(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with aphelion distance in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_aphelion_distance(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with perihelion time in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_perihelion_time(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with mean anomaly in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_mean_anomaly(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with mean motion in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_mean_motion(asteroid)).to be_kind_of(String)
      end
    end

    it "should respond with equinox in orbital data as a string" do
      @nasa_browse.get_neos.each do |asteroid|
        expect(@nasa_browse.get_orbit_equinox(asteroid)).to be_kind_of(String)
      end
    end
  end
end
