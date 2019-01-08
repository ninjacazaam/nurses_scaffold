module Rostering
  class Nurse
    attr_reader :name, :uid

    def initialize(uid, name)
      @uid = uid
      @name = name
    end

    def ==(other)
      uid == other.uid
    end
  end
end
