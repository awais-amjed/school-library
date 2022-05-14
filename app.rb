require './book'
require './student'
require './teacher'

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

  def create_student(name, age, parental_permission)
    @people << Student.new(age, name, parent_permission: parental_permission)
  end

  def create_teacher(name, specialization, age, parental_permission)
    @people << Teacher.new(age, specialization, name, parent_permission: parental_permission)
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(book, person, date)
    @rentals << Rental.new(date, book, person)
  end
end
