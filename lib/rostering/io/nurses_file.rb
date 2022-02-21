require 'csv'

module Rostering
  module IO
    class NursesFile
      def self.read(filename)
        [].tap do |nurses|
          CSV.foreach(filename, headers: true) do |row|
            nurses << row["name"]
          end
        end
      end
    end
  end
end
