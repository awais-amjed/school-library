require 'book'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people
    @people.each { |person| puts "[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}" }
  end

  def list_all_rentals(id)
    @rentals.each do |rental|
      puts "Date: \"#{rental.date}\", Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
