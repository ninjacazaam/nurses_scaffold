module Rostering
  class ShiftRoster
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def nurses
      [Nurse.new('Nurse Name')]
    end
  end
end
