require 'month'

module Rostering
  class Shift
    attr_reader :name, :date

    def initialize(name, date)
      raise ArgumentError unless date
      raise ArgumentError if name.nil? || name == ''

      @name = name
      @date = date
    end
  end
end
