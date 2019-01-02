require 'rostering/nurse'

module Rostering
  class ShiftRoster
    attr_reader :name, :nurses

    def initialize(name, nurses = [])
      @name = name
      @nurses = nurses
    end
  end
end
