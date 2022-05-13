class Student < Person
  def initialize(age, classroom, name = nil, parent_permission: nil)
    super(age, name, parent_permission: parent_permission)

    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
