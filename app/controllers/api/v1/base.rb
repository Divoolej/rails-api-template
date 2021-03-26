# frozen_string_literal: true

module API
  module V1
    class Base < API::Base
      format :json
      version "v1", using: :path

      helpers Helpers::Params
      helpers Helpers::Response

      mount System::Base

      if Rails.env.development? || Rails.env.staging?
        add_swagger_documentation({
          info: { title: "APP_NAME" },
          array_use_braces: true,
          doc_version: nil,
          base_path: "/api/v1",
          add_version: false,
          security_definitions: {
            auth_token: {
              description: "Bearer authorization",
              type: "apiKey",
              name: "Authorization",
              in: "header",
            },
          },
          security: [{ auth_token: [] }],
          tags: [
            { name: "system", description: "Get system information" },
          ],
        })
      end
    end
  end
end
