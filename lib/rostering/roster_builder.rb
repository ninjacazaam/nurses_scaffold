require 'rostering/roster'

module Rostering
  # Initialize with a certain set of configuration options and then use
  # this to build rosters for specific time periods.
  class RosterBuilder
    DEFAULT_CONFIG = {
      nurses_per_shift: 5,
      shift_names: %w[morning evening night],
    }.freeze

    def initialize(config = DEFAULT_CONFIG)
      @config = config
    end

    def build(date_range, all_nurses)
      # Code to build the roster goes here, and a roster object is returned.
      # For now, it's just returning an empty roster
      # binding.pry
      roster_attributes = {}
      date_range.each do |date|
        nurses_for_today = all_nurses
        shifts = {}
        @config[:shift_names].each do |shift|
          shifts[shift.to_sym] = all_nurses.sample(@config[:nurses_per_shift])
          nurses_for_today - shifts[shift.to_sym]
        end
          roster_attributes[date] = shifts
      end
      Roster.new(roster_attributes)
      # binding.pry
    end
  end
end



# below was the old and conveluted way to do this before i realised it was simpler

# roster_attributes = {}
# date_range.each do |date|
#   instance_variable_set("@#{date.strftime("%a%m%d%A")}", {})
#   @config[:shift_names].each do |shift|
#     instance_variable_set("@#{shift}", all_nurses.sample(@config[:nurses_per_shift]))
#     instance_variable_get("@#{date.strftime("%a%m%d%A")}".to_sym)["#{shift}".to_sym] = instance_variable_get("@#{shift}")
#   end
#   roster_attributes["#{date}"] = instance_variable_get("@#{date.strftime("%a%m%d%A")}")
# end


# for each day in the date range, generate the three shifts

# for each shift in a day, populate with @config[:nurses_per_shift] nurses

# Check that the shift is not violating a rule

# Return the Roster object to the roster builder

# ^ this should be done in the roster Model file

# ^ no it should not

# the roster BUILDER should find all the shifts in config and assign nurses to it

# roster = {}
# date_range.each do |date|
#   instance_variable_set("@#{date.strftime("%a%m%d")}", {})
#     @config[:shift_names].each do |shift|
#       instance_variable_set("@#{shift}", all_nurses.sample(@config[:nurses_per_shift]))
#       instance_variable_get("@#{date.strftime("%a%m%d")}")["#{shift}"] = instance_variable_get("@#{shift}")
#     end
#     roster["#{date}"] = instance_variable_get("@#{date.strftime("%a%m%d")}")
# end

# ^ These need to be key value pairs

# Roster: [
#           date1: [
                    # shift1: [nurses..],
                    # shift2: [nurses..]
                    # shift..: [nurses..]
#                  ]

# ]
# ]
