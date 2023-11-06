class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', paren_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @paren_permission = paren_permission
  end

  def can_use_services?
    of_age? || @paren_permission
  end

  private

  def of_age?
    age >= 18
  end
end
