class Teacher < Person
  def initialize(age, specialization, name = nil, parent_permission = nil)
    super(age, name, parent_permission)

    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
