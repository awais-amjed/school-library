class Teacher < Person
  def initialize(age, name = nil, parent_permission = nil, specialization)
    super(age, name, parent_permission)

    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
