require "rails_helper"

RSpec.describe "Trimesters", type: :request do
  describe "GET /trimesters/:id/edit" do
    it "shows the application deadline label" do
      t = Trimester.create!(
        term: "Fall",
        year: 2025,
        application_deadline: Date.today + 30,
        start_date: Date.new(2025, 9, 1),
        end_date:   Date.new(2025,12, 1)
      )

      get edit_trimester_path(t), headers: { "ACCEPT" => "text/html" }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Application deadline")
    end
  end
end
