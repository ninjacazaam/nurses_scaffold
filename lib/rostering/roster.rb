module Rostering
  # Some sort of data structure representing the roster
  class Roster
    attr_reader :shifts, :nurses, :date_range

    def initialize(attributes)
      # @shifts = attributes.fetch(:shifts)
      # @nurses = attributes.fetch(:nurses)
      # @date_range = attributes.fetch(:date_range)
      @attributes = attributes
      # @dates = attributes.keys.each { |key| Date.parse(key)}
      # @shifts = attributes[:shifts]
    end

    def each_shift
      @attributes.each do |date, shifts|
        shifts.each do |shift, nurses|
          # binding.pry
          yield(Date.parse(date), shift, nurses)
        end
      end
      # raise NotImplementedError, 'You need to implement this method so the output formatter can work'
    end
  end
end

# Roster has many shifts
# each shift can belong to one roster?
# Each shift has many nurses
# nurses can belong to many shifts
#
# According to the text formatter each roster is x shifts for one date
# each_shift is going to be a block: yield etc

# A Roster is made up of shifts
# Each shift has a date
# each Shift has nurses
