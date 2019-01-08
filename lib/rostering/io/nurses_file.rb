require 'rostering/nurse'

module Rostering
  module IO
    class NursesFile
      def self.read(filename)
        [].tap do |nurses|
          CSV.foreach(filename, headers: true) do |row|
            nurses << Nurse.new(row["uid"], row["name"])
          end
        end
      end
    end
  end
end
