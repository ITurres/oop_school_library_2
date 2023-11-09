require_relative 'class_decorators/nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super() # * call Nameable's initialize
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    new_rental = Rental.new(date, book, self)
    @rentals << new_rental unless @rentals.include?(new_rental)
  end

  private

  def of_age?
    age >= 18
  end
end
