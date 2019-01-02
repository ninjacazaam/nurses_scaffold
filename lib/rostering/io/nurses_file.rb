require 'rostering/nurse'

module Rostering
  module IO
    class NursesFile
      def self.read(filename)
        File.readlines(filename).map do |name|
          Nurse.new(name.strip)
        end
      end
    end
  end
end
