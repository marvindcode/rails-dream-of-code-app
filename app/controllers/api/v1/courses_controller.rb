class Api::V1::CoursesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render json: {
      courses: [
        {
          id: 55,
          title: "Intro to Programming",
          application_deadline: "2025-01-15",
          start_date: "2025-01-15",
          end_date: "2025-01-15"
        },
        {
          id: 61,
          title: "Ruby on Rails",
          application_deadline: "2025-01-15",
          start_date: "2025-01-15",
          end_date: "2025-01-15"
        }
      ]
    }, status: :ok
  end
end
