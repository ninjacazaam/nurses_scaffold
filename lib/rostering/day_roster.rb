require 'rostering/shift_roster'

module Rostering
  class DayRoster
    attr_reader :shift_rosters, :date

    def initialize(date, shift_rosters = [])
      @date = date
      @shift_rosters = shift_rosters
    end
  end
end
