# frozen_string_literal: true

module API
  module V1
    module System
      class Uptime < Base
        desc "GET /system/uptime" do
          summary "Get current server uptime"
          detail "Returns the difference between current time and a timestamp \
            stored during application initialization (in seconds)"
          success code: 200, message: I18n.t("api.response.success")
        end

        get :uptime do
          { data: { uptime: Time.now - APP_NAME::BOOTED_AT } }
        end
      end
    end
  end
end
