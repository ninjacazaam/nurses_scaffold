class Staff
  attr_reader :name

  def self.build_array(names)
    names.map { |name| Staff.new(name) }
  end

  def initialize(name)
    @name = name
  end
end
