require "rails_helper"

RSpec.describe "Courses", type: :request do
  describe "GET /courses/:id" do
    it "returns a 200 OK status and shows the course title and an enrolled student" do
      trimester = Trimester.create!(
        term: "Summer",
        year: Date.today.year.to_s,
        start_date: Date.today - 1.month,
        end_date:   Date.today + 1.month,
        application_deadline: Date.today - 2.months
      )

      coding_class = CodingClass.create!(title: "Python 200")
      course       = Course.create!(coding_class: coding_class, trimester: trimester, max_enrollment: 15)

      student = Student.create!(first_name: "Alex", last_name: "Diaz", email: "alex@yahoo.com")
      Enrollment.create!(student: student, course: course)

      get course_path(course)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Python 200") 
      expect(response.body).to include("Alex Diaz")     
    end
  end
end
