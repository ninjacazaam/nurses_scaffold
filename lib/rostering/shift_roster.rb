module Rostering
  class ShiftRoster
    attr_reader :shift

    def initialize(shift, staff)
      raise ArgumentError unless shift.is_a?(Shift)

      @shift = shift
      @staff = staff
    end

    def staff_names
      staff.map(&:name)
    end

    def shift_name
      shift.name
    end

    private

    attr_reader :staff
  end
end
