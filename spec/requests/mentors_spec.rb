require 'rails_helper'

RSpec.describe "Mentors", type: :request do
  describe "GET /mentors" do
    it "works! (now write some real specs)" do
      get mentors_path
      expect(response).to have_http_status(200)
    end

    it "lists mentors on the page" do
      # m1 = Mentor.create!(first_name: "Alex",   last_name: "Zil", email: "mad@aoli.com",   max_concurrent_students: 3)
      # m2 = Mentor.create!(first_name: "Ana", last_name: "Diaz",   email: "anita@aoli.com", max_concurrent_students: 4)

      let!(:mentor) { 
        Mentor.create(
          first_name: "Alex",
          last_name: "Zil",
          email: "mad@aoli.com",
          max_concurrent_students: 2
        )
      end
      let!(:mentor2) { 
        Mentor.create(
          first_name: "Ana",
          last_name: "Diaz",
          email: "anita@aoli.com"
          max_concurrent_students: 3
        )
      end

      get mentors_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Mentors")         
      expect(response.body).to include("Show this mentor")
      expect(response.body).to include("Alex", "Zil", "mad@aoli.com")
      expect(response.body).to include("Ana", "Diaz", "anita@aoli.com")
    end
  end

  describe "GET /mentors/:id" do
    it "shows the mentor details" do
      mentor = Mentor.create!(first_name: "Martin", last_name: "Dsdfd", email: "mdsdfd@camp.com", max_concurrent_students: 2)

      get mentor_path(mentor)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Martin", "Dsdfd", "mdsdfd@camp.com")
      expect(response.body).to include("Edit this mentor", "Back to mentors")
    end
  end
end
