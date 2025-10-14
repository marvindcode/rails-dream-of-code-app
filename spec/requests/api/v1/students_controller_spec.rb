require "rails_helper"

RSpec.describe "Api::V1::Students", type: :request do
  describe "POST /api/v1/students" do
    context "with valid params" do
      let(:valid_params) do
        {
          student: {
            first_name: "Marge",
            last_name:  "Simpson",
            email:      "validstudent@example.com"
          }
        }
      end

      it "creates a new student and returns 201 with payload" do
        expect {
          post "/api/v1/students", params: valid_params, as: :json
        }.to change(Student, :count).by(1)

        expect(response).to have_http_status(:created)
        body = JSON.parse(response.body)
        expect(body.dig("student", "email")).to eq("validstudent@example.com")
        expect(body.dig("student", "id")).to be_a(Integer)
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          student: {
            first_name: "",
            last_name:  "Smith",
            email:      ""
          }
        }
      end

      it "does not create a student and returns 422 with errors" do
        expect {
          post "/api/v1/students", params: invalid_params, as: :json
        }.not_to change(Student, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        body = JSON.parse(response.body)
        expect(body).to have_key("errors")
        expect(body["errors"]).to be_an(Array)
        expect(body["errors"]).not_to be_empty
      end
    end
  end
end
