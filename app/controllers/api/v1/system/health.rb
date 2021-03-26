# frozen_string_literal: true

module API
  module V1
    module System
      class Health < Base
        get :health, {
          summary: "Get application health status",
          detail: "This endpoint doesn't have any logic, it's only a way to check if the web server is responding.",
          success: { code: 200, message: I18n.t("api.response.success") },
        } do
          { data: { healthy: true } }
        end

        namespace :health do
          get :db, {
            summary: "Get PostgreSQL health status",
            detail: "Checks if a database connection is available.",
            success: { code: 200, message: I18n.t("api.response.success") },
            failure: [{ code: 500, message: I18n.t("api.response.internal_server_error") }],
          } do
            healthy = ActiveRecord::Base.connection.active?
            status :internal_server_error unless healthy
            { data: { healthy: healthy } }
          end

          get :redis, {
            summary: "Get Redis health status",
            detail: "Checks if a Redis connection is available",
            success: { code: 200, message: I18n.t("api.response.success") },
            failure: [{ code: 500, message: I18n.t("api.response.internal_server_error") }],
          } do
            healthy = Sidekiq.redis(&:info).present?
            status :internal_server_error unless healthy
            { data: { healthy: healthy } }
          end
        end
      end
    end
  end
end
