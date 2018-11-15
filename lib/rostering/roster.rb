module Rostering
  class Roster
    def initialize
      @days = {}
    end

    def each_day
      days.each do |key, value|
        yield key, value
      end
    end

    private

    attr_accessor :days
  end
end
