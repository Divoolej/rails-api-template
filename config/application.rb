require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# Sprockets is only required for Swagger documentation
require "sprockets/railtie" if Rails.env.development? || Rails.env.staging?

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module APP_NAME
  class Application < Rails::Application
    config.load_defaults 6.1

    config.active_job.queue_adapter = :sidekiq

    # Return the (decrypted) Rails credentials for the current environment.
    # Returns a deep OpenStruct for convenience.
    def env_credentials
      @env_credentials ||= begin
        # Converting to JSON is safe as credentials will never contain Ruby objects
        JSON.parse credentials.config.to_json, object_class: OpenStruct
      end
    end

    config.api_only = true
  end
end
