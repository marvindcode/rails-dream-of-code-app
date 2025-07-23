# Question 1

CodingClass.all.each do |coding_class|
    puts coding_class.title
end

Course.create(coding_class_id: 1, trimester_id: 8, max_enrollment: 25)

spring2026 = Trimester.find_by(year: '2026', term: 'Spring')

CodingClass.all.each do |coding_class|
    Course.create(coding_class_id: coding_class.id, trimester_id: spring2026.id, max_enrollment: 25)
    puts coding_class.title
end

#Question 2

student = Student.create!({first_name: "Alex", last_name: "Diaz", email: "alex.di@test.com"})

intro_class = CodingClass.find_by(title: "Intro to Programming")

trimester = Trimester.find_by(year: "2026", term: "Spring")

course = Course.find_by(coding_class_id: intro_class.id, trimester_id: trimester.id)

enrollment = Enrollment.create(student_id: student.id, course_id: course.id)

mentor = Mentor.all.find do |mentor|
    MentorEnrollmentAssignment.where(mentor_id: mentor.id).count(:enrollment_id)<= 2
end

assigned= MentorEnrollmentAssignment.create!(mentor_id: mentor.id, enrollment_id: enrollment.id)