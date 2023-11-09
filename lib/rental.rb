class Rental
  attr_assessor :date
  attr_reader :book, :person # * needed to access on the rental_to_s method.

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book = book # * sets the book to the rental.
    book.add_rental(self) # * adds the rental to the book.
  end

  def person=(person)
    @person = person # * sets the person to the rental.
    person.add_rental(self) # * adds the rental to the person.
  end

  def rental_to_s
    "Date: #{date}, Book: \"#{book.title}\" By #{book.author}, Rented by: #{person.name}"
  end
end
