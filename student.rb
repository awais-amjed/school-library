class Student < Person
  def initialize(age, name = nil, parent_permission = nil, classroom)
    super(age, name, parent_permission)

    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
