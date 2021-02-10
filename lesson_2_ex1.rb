class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    @first_name + ' ' + @last_name
  end 

  def name=(full_name)
    parse_full_name(full_name)
  end 

  def compare_names(name)
    self.first_name == name.first_name && self.last_name == name.last_name
  end 

  private 

  def parse_full_name(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end 
end 

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.compare_names(rob)