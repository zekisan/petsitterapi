module Concerns
  module DistanceCalculation
    extend ActiveSupport::Concern

    def search_near_sitters
      Sitter.all.map do |s|
        current_sitter = Geokit::Geocoders::GoogleGeocoder.geocode s.address
        s if (sitter_geocoder.distance_to current_sitter, units: :kms) <= 5
      end.compact
    end

    def sitter_geocoder
      @geocoder ||= Geokit::Geocoders::GoogleGeocoder.geocode self.address
    end
  end
end