require 'rostering/roster'

module Rostering
  module IO
    class TextFormatter

      def initialize(io)
        @io = io
      end

      def write_roster(roster)
        roster.day_rosters.each do |day_roster|
          write_day_roster day_roster
        end
      end

      def write_day_roster(day_roster)
        io << "#{day_roster.date.iso8601}\n"
        day_roster.shift_rosters.each do |shift_roster|
          write_shift_roster shift_roster
        end
      end

      def write_shift_roster(shift_roster)
        io << "  #{shift_roster.name}: " + shift_roster.nurses.map(&:name).join(', ') + "\n"
      end

      private

      attr_reader :io
    end
  end
end
