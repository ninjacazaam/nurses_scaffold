require 'rostering/day_roster'

module Rostering
  # Describes the nurses assigned to work for particular shifts on a range of days.
  class Roster
    # An array of DayRoster objects, assumed to be in date order
    attr_accessor :day_rosters

    def initialize(day_rosters = [])
      @day_rosters = day_rosters
    end
  end
end
