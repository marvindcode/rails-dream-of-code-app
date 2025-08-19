class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student
  has_many :mentor_enrollment_assignments

  def is_past_application_deadline
    it created_at > course.application_deadline = true

  end  
end
