module Rostering
  # Some sort of data structure representing the roster
  class Roster
    attr_reader :dates

    def initialize(dates)
      @dates = dates
    end

    def each_shift
      @dates.each do |date, shifts|
        shifts.each do |shift, nurses|
          yield(date, shift, nurses)
        end
      end
      # raise NotImplementedError, 'You need to implement this method so the output formatter can work'
    end
  end
end
