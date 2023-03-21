require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, id = SecureRandom.uuid, name = 'Unknown', parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
