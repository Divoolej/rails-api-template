# frozen_string_literal: true

require "rails_helper"

RSpec.describe API::V1::System::Uptime, type: :request do
  describe "GET /api/v1/system/uptime" do
    let(:endpoint) { "/api/v1/system/uptime" }

    it "responds with 200 OK" do
      get endpoint
      expect(response.status).to eq(200)
    end

    it "returns the application's uptime" do
      freeze_time do
        get endpoint
        expect(response.json_body).to eq({ data: { uptime: Time.now - APP_NAME::BOOTED_AT } })
      end
    end
  end
end
