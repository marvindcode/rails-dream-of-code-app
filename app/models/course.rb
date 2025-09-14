class Course < ApplicationRecord
  belongs_to :coding_class
  belongs_to :trimester
  has_many :enrollments
  has_many :students, through: :enrollments

  def student_name_list
    names_list = []
    self.enrollments.each do |enrollment|
      names_list << "#{enrollment.student.first_name} #{enrollment.student.last_name}"
    end
    
    names_list
  end 
  
  def student_email_list
    students.where.not(email: [nil, ""]).distinct.order(:email).pluck(:email)

  end
end
