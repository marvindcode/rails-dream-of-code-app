require "rails_helper"

RSpec.describe "Dashboard", type: :request do
  describe "GET /dashboard" do
    before do
     
      Trimester.create!(
        term: "Current term",
        year: Date.today.year.to_s,
        start_date: Date.today - 1.day,
        end_date:   Date.today + 2.months,
        application_deadline: Date.today - 16.days
      )

      Trimester.create!(
        term: "Fall",
        year: Date.today.year.to_s,
        start_date: Date.today + 2.months,   
        end_date:   Date.today + 5.months,
        application_deadline: Date.today + 1.month
      )
    end

    it "returns a 200 OK status" do
      get "/dashboard"
      expect(response).to have_http_status(:ok)
    end

    it "displays the current trimester" do
      get "/dashboard"
      expect(response.body).to include("Current term - #{Date.today.year}")
    end

    it "displays the header" do
      get "/dashboard"
      expect(response.body).to include("Admin Dashboard")
    end

    it "displays links to the courses in the current trimester" do
      skip("implement later")
    end

    it "displays the upcoming trimester" do
      get "/dashboard"
      expect(response.body).to include("Fall - #{Date.today.year}")
    end

    it "displays links to the courses in the upcoming trimester" do
      skip("implement later")
    end
  end
end

