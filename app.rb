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
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_all_rentals(id)
    selected_person = @people.select { |person| person.id == id }
    selected_person.rentals.each do |rental|
      puts "Date: \"#{rental.date}\", Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def create_student(name, age, parental_permission)
    @people << Student.new(age, 'No classroom', name, parent_permission: parental_permission)
  end

  def create_teacher(name, specialization, age)
    @people << Teacher.new(age, specialization, name)
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(book, person, date)
    @rentals << Rental.new(date, book, person)
  end
end
