require 'rostering/roster'

module Rostering
  module IO
    class Roster
      def self.text_format(roster)
        roster.to_h.inspect
      end
    end
  end
end
