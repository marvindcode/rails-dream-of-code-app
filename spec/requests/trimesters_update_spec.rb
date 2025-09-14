require "rails_helper"

RSpec.describe "Update trimester deadline", type: :request do
  let!(:trimester) do
    Trimester.create!(
      term: "Fall",
      year: 2025,
      application_deadline: Date.new(2025, 9, 30),
      start_date: Date.new(2025, 9, 1),
      end_date:   Date.new(2025,12, 1)
    )
  end
  
  it "updates when valid date and id exist" do
    put trimester_path(trimester), params: { trimester: { application_deadline: "2025-10-15" } }
    expect(response).to have_http_status(:ok).or have_http_status(:found)
    expect(trimester.reload.application_deadline).to eq(Date.new(2025,10,15))
  end

  it "returns 400 when deadline missing" do
    put trimester_path(trimester), params: { trimester: { application_deadline: "" } }
    expect(response).to have_http_status(:bad_request)
  end

  it "returns 400 when deadline invalid" do
    put trimester_path(trimester), params: { trimester: { application_deadline: "not-a-date" } }
    expect(response).to have_http_status(:bad_request)
  end

  it "returns 404 when trimester id not found" do
    put "/trimesters/999999", params: { trimester: { application_deadline: "2025-10-01" } }
    expect(response).to have_http_status(:not_found)
  end
end
