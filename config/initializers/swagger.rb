# frozen_string_literal: true

if Rails.env.development? || Rails.env.staging?
  GrapeSwaggerRails.options.app_name = "APP_NAME"
  GrapeSwaggerRails.options.url = "/api/v1/swagger_doc.json"
  GrapeSwaggerRails.options.hide_url_input = true
  GrapeSwaggerRails.options.hide_api_key_input = true

  GrapeSwaggerRails.options.before_action do
    GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
  end
end
