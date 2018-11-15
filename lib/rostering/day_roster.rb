require 'rostering/shift_roster'

module Rostering
  class DayRoster
    def initialize
      @shift_rosters = []
    end

    def each_shift(&block)
      shift_rosters.each(&block)
    end

    private

    attr_reader :shift_rosters
  end
end
