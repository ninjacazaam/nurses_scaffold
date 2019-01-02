module Rostering
  # Some sort of data stucture representing the roster
  class Roster
    def each_shift
      raise NotImplementedError, 'You need to implement this method so the output formatter can work'
    end
  end
end
