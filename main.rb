require './app'

def ask_for_student_parameters
  print 'Enter the name of student: '
  name = gets.chomp
  print 'Enter the age of student: '
  age = gets.chomp
  print 'Does the student have parent permission? [Y/N]: '
  parent_permission = gets.chomp
  [name, age, parent_permission]
end

def ask_for_teacher_parameters
  print 'Enter the name of teacher: '
  name = gets.chomp
  print 'Enter the age of teacher: '
  age = gets.chomp
  print 'Enter the specialization of teacher: '
  specialization = gets.chomp
  [name, age, specialization]
end

def handle_create_person(app)
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  choice = gets.chomp
  case choice
  when '1'
    name, age, parent_permission = ask_for_student_parameters
    if %w[y n].any?(parent_permission.downcase)
      app.create_student(name, age, parent_permission)
      puts '<-- Student Created Successfully -->'
    else
      puts '<-- Wrong input! Try again -->'
    end
  when '2'
    name, age, specialization = ask_for_teacher_parameters
    app.create_teacher(name, specialization, age)
    puts '<-- Teacher Created Successfully -->'
  else
    puts '<-- Wrong Choice! Try again -->'
  end
end

def handle_choice(app, choice)
  case choice
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    handle_create_person(app)
  else
    puts '<-- Wrong Choice! Try again -->'
  end
end

def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    print "\n1 - List all books\n"\
          "2 - List all people\n"\
          "3 - Create a person\n"\
          "4 - Create a book\n"\
          "5 - Create a rental\n"\
          "6 - List all rentals for a given person id\n"\
          "7 - Exit\n\n"\
          'Your Choice: '
    choice = gets.chomp
    break if choice == '7'

    handle_choice(app, choice)
  end
end

main
