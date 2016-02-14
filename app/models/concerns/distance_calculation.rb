module Concerns
  module DistanceCalculation
    extend ActiveSupport::Concern

    def search_near_sitters(pet_owner, animals)
      sitters_for_animals = get_sitters_by_animals(animals)
      current_owner_distance = Geokit::Geocoders::GoogleGeocoder.geocode pet_owner.address
      sitters_for_animals.all.map do |s|
        s if (sitter_geocoder(s).distance_to current_owner_distance, units: :kms) <= 5
      end.compact
    end

    def sitter_geocoder(sitter)
      @geocoder ||= Geokit::Geocoders::GoogleGeocoder.geocode sitter.address
    end

    def get_sitters_by_animals(animals)
      sitters_for_animals = Sitter.all
      sitters_for_animals = sitters_for_animals.joins(:animals).where(animals: {name: animals}) if animals
      sitters_for_animals
    end
  end
end