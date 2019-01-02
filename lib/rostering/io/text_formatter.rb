require 'rostering/roster'

module Rostering
  module IO
    class TextFormatter
      def initialize(io)
        @io = io
      end

      def write_roster(roster)
        roster.each_shift do |date, shift_name, nurses|
          nurse_names = nurses.map(&:name).join(', ')
          io << "#{date.iso8601} | #{shift_name} | #{nurse_names}\n"
        end
      end

      private

      attr_reader :io
    end
  end
end
