attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    book.rentals << self
    person.rentals << self
  end
end