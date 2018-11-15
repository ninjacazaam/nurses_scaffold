class Nurse
  attr_reader :name

  def self.build_array(names)
    names.map { |name| new(name) }
  end

  def initialize(name)
    @name = name
  end
end
