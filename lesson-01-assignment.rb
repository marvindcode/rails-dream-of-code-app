#Question 1
#Task 1: Collect emails for students in the current Intro course
intro_class = CodingClass.find_by(title: 'Intro to Programming')

find_trimester = Trimester.find_by(year: '2025', term: 'Spring')

course = Course.find_by(trimester_id: find_trimester.id, coding_class_id: intro_class.id)

enrollment = Enrollment.where(course_id: 5)

enrollment.first(2).each do |enrollment|
    puts "#{enrollment.student.id}, #{enrollment.student.email}"





end


#Question 2

#Task 2: Email all mentors who have not assigned a final grade

intro_class = CodingClass.find_by(title: 'Intro to Programming')

find_trimester = Trimester.find_by(year: '2025', term: 'Spring')

course = Course.find_by(trimester_id: find_trimester.id, coding_class_id: intro_class.id)

enrollments = Enrollment.where(course_id: course.id, final_grade: nil)

mentor_enrollment_assignments = MentorEnrollmentAssignment.where(enrollment_id: enrollments.pluck(:id))

mentor_enrollment_assignments.first(2).each do |assignment|
    mentor = assignment.mentor
    puts "#{mentor.id}, #{mentor.email}"
end



