# frozen_string_literal: true

require "rails_helper"

RSpec.describe API::V1::System::Health, type: :request do
  describe "GET /api/v1/system/health" do
    let(:endpoint) { "/api/v1/system/health" }

    it "responds with 200 OK" do
      get endpoint
      expect(response.status).to eq(200)
    end

    it "returns the application's health status" do
      get endpoint
      expect(response.json_body).to eq({ data: { healthy: true } })
    end
  end

  describe "GET /api/v1/system/health/db" do
    let(:endpoint) { "/api/v1/system/health/db" }

    before { allow(ActiveRecord::Base).to receive(:connection).and_return(double(active?: healthy)) }

    context "when database is healthy" do
      let(:healthy) { true }

      it "responds with 200 OK" do
        get endpoint
        expect(response.status).to eq(200)
      end

      it "returns the application's health status" do
        get endpoint
        expect(response.json_body).to eq({ data: { healthy: true } })
      end
    end

    context "when database is not healthy" do
      let(:healthy) { false }

      it "responds with 500 Internal Server Error" do
        get endpoint
        expect(response.status).to eq(500)
      end

      it "returns the application's health status" do
        get endpoint
        expect(response.json_body).to eq({ data: { healthy: false } })
      end
    end
  end

  describe "GET /api/v1/system/health/redis" do
    let(:endpoint) { "/api/v1/system/health/redis" }

    before { allow_any_instance_of(Redis).to receive(:info).and_return(redis_info) }

    context "when Redis is healthy" do
      let(:redis_info) { "dummy_info" }

      it "responds with 200 OK" do
        get endpoint
        expect(response.status).to eq(200)
      end

      it "returns the application's health status" do
        get endpoint
        expect(response.json_body).to eq({ data: { healthy: true } })
      end
    end

    context "when Redis is not healthy" do
      let(:redis_info) { nil }

      it "responds with 500 Internal Server Error" do
        get endpoint
        expect(response.status).to eq(500)
      end

      it "returns the application's health status" do
        get endpoint
        expect(response.json_body).to eq({ data: { healthy: false } })
      end
    end
  end
end
