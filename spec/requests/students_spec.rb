require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "GET /students" do
    # it "works! (now write some real specs)" do
    #   get students_path
    #   expect(response).to have_http_status(200)
    let!(:student) { 
        Student.create(
          first_name: "KJ",
          last_name: "Loving",
          email: "kj@test.com"
        )
      }
      let!(:student2) { 
        Student.create(
          first_name: "AJ",
          last_name: "Suning",
          email: "aj@test.com"
        )
      }

      it "works! (now write some real specs)" do
        get students_path
        expect(response).to have_http_status(200)

      # it displays students index do
      #   get students_path

    end
  end
end
