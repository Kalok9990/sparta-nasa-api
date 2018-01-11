require 'spec_helper'

describe Nasaios do

  context 'requesting information on all asteroids through feed' do

    before(:all) do
      @nasa_feed = Nasaios.new.feed
      @nasa_feed.get_list("2015-09-06", "2015-09-07")
    end

    it "should respond as a hash" do
      expect(@nasa_feed.list).to be_kind_of(Hash)
    end

    it "should respond with links as a hash" do
      expect(@nasa_feed.get_link).to be_kind_of(Hash)
    end

    it "should respond with next link as a string" do
      expect(@nasa_feed.get_link_next).to be_kind_of(String)
    end

    it "should respond with prev link as a string" do
      expect(@nasa_feed.get_link_prev).to be_kind_of(String)
    end

    it "should respond with self link as a string" do
      expect(@nasa_feed.get_link_self).to be_kind_of(String)
    end

    it "should respond with an element count as an integer" do
      expect(@nasa_feed.get_count).to be_kind_of(Integer)
    end

    it "should respond with near earth objects as a hash" do
      expect(@nasa_feed.get_neo).to be_kind_of(Hash)
    end

    it "should respond with a date as the key as an array" do
      @nasa_feed.get_dates.each do |date|
        expect(@nasa_feed.get_neo[date]).to be_kind_of(Array)
      end
    end

    it "should respond with links in the array as a hash" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_key_link(object)).to be_kind_of(Hash)
        end
      end
    end

    it "should respond with a self link in the array as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_key_selflink(object)).to be_kind_of(String)
        end
      end
    end


    it "should respond with a neo reference id in the array as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_neo_id(object)).to be_kind_of(String)
        end
      end
    end

    it "should respond with a name in the array as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_name(object)).to be_kind_of(String)
        end
      end
    end

    it "should respond with a nasa jpl url in the array as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_url(object)).to be_kind_of(String)
        end
      end
    end

    it "should respond with an absolute magnitude in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_magnitude(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an estimated diameter in the array as a hash" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter(object)).to be_kind_of(Hash)
        end
      end
    end

    it "should respond with an estimated diameter (km) in the array as a hash" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_km(object)).to be_kind_of(Hash)
        end
      end
    end

    it "should respond with an estimated minimum diameter (km) in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_km_min(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an estimated maximum diameter (km) in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_km_max(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an estimated diameter (m) in the array as a hash" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_m(object)).to be_kind_of(Hash)
        end
      end
    end

    it "should respond with an estimated minimum diameter (m) in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_m_min(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an estimated maximum diameter (m) in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_m_max(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an estimated diameter (miles) in the array as a hash" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_miles(object)).to be_kind_of(Hash)
        end
      end
    end

    it "should respond with an estimated minimum diameter (miles) in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_miles_min(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an estimated maximum diameter (miles) in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_miles_max(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an estimated diameter (feet) in the array as a hash" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_feet(object)).to be_kind_of(Hash)
        end
      end
    end

    it "should respond with an estimated minimum diameter (feet) in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_feet_min(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an estimated maximum diameter (feet) in the array as a float" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_est_diameter_feet_max(object)).to be_kind_of(Float)
        end
      end
    end

    it "should respond with an potentially hazardous asteroid in the array as true or false" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_hazardous(object)).to be_truthy.or be_falsey
        end
      end
    end

    it "should respond with a close approach data in the array as an array" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          expect(@nasa_feed.get_approach_data(object)).to be_kind_of(Array)
        end
      end
    end

    it "should respond with a close approach date as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_approach_date(data)).to be_kind_of(String)
          end
        end
      end
    end

    it "should respond with a epoch date close approach as an integer" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_epoch_date(data)).to be_kind_of(Integer)
          end
        end
      end
    end

    it "should respond with a relative velocity as a hash" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_velocity(data)).to be_kind_of(Hash)
          end
        end
      end
    end

    it "should respond with a relative velocity (km/s) as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_velocity_kms(data)).to be_kind_of(String)
          end
        end
      end
    end

    it "should respond with a relative velocity (km/h) as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_velocity_kmh(data)).to be_kind_of(String)
          end
        end
      end
    end

    it "should respond with a relative velocity (miles/h) as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_velocity_mh(data)).to be_kind_of(String)
          end
        end
      end
    end

    it "should respond with a miss distance as a hash" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_miss_distance(data)).to be_kind_of(Hash)
          end
        end
      end
    end

    it "should respond with an astronomical miss distance as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_miss_distance_astronomical(data)).to be_kind_of(String)
          end
        end
      end
    end

    it "should respond with a lunar miss distance as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_miss_distance_lunar(data)).to be_kind_of(String)
          end
        end
      end
    end

    it "should respond with a kilometers miss distance as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_miss_distance_km(data)).to be_kind_of(String)
          end
        end
      end
    end

    it "should respond with a miles miss distance as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_miss_distance_miles(data)).to be_kind_of(String)
          end
        end
      end
    end

    it "should respond with an orbiting body as a string" do
      @nasa_feed.get_dates.each do |date|
        @nasa_feed.get_neo[date].each do |object|
          @nasa_feed.get_approach_data(object).each do |data|
            expect(@nasa_feed.get_orbiting_body(data)).to be_kind_of(String)
          end
        end
      end
    end
  end
end
