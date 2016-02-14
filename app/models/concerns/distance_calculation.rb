module Concerns
  module DistanceCalculation
    extend ActiveSupport::Concern

    class_methods do
      def search_near_sitters(animals)
        sitters_for_animals = Sitter.joins(:animals).where(animals: {name: animals})

        sitters_for_animals.all.map do |s|
          current_sitter_distance = Geokit::Geocoders::GoogleGeocoder.geocode s.address
          s if (sitter_geocoder(s).distance_to current_sitter_distance, units: :kms) <= 5
        end.compact
      end

      def sitter_geocoder(sitter)
        @geocoder ||= Geokit::Geocoders::GoogleGeocoder.geocode sitter.address
      end
    end
  end
end