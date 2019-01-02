require 'rostering/day_roster'

module Rostering
  # Describes the nurses assigned to work for particular shifts on a range of days.
  class Roster
    attr_accessor :day_rosters

    def initialize
      @day_rosters = [DayRoster.new(Date.today)]
    end
  end
end
