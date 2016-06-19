module Concerns
  module DistanceCalculation
    extend ActiveSupport::Concern

    def search_near_sitters(animals)
      sitters_for_animals = get_sitters_by_animals(animals)
      sitters_for_animals.all.map do |s|
        s if distance_between_points(self.latitude, self.longitude, s.latitude, s.longitude) <= 20
      end.compact.uniq
    end

    def get_sitters_by_animals(animals)
      sitters_for_animals = Sitter.all
      sitters_for_animals = sitters_for_animals.joins(:animals).where(animals: {name: animals}) if animals
      sitters_for_animals
    end

    private

    def distance_between_points(lat1, long1, lat2, long2)
      dtor = Math::PI/180
      r = 6378.14

      rlat1 = lat1 * dtor
      rlong1 = long1 * dtor
      rlat2 = lat2 * dtor
      rlong2 = long2 * dtor

      dlon = rlong1 - rlong2
      dlat = rlat1 - rlat2

      a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
      d = r * c

      return d
    end

    def power(num, pow)
      num ** pow
    end
  end
end