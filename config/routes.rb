# frozen_string_literal: true

require "sidekiq/web"
require "crono/web"

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount GrapeSwaggerRails::Engine => "/api/v1/docs" if Rails.env.development? || Rails.env.staging?
  mount API::Base, at: "/api"

  if Rails.env.production?
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      # https://github.com/mperham/sidekiq/wiki/Monitoring#rails-http-basic-auth-from-routes
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(username),
        ::Digest::SHA256.hexdigest(Rails.application.env_credentials.sidekiq.username)
      ) & ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(password),
        ::Digest::SHA256.hexdigest(Rails.application.env_credentials.sidekiq.password)
      )
    end

    Crono::Web.use Rack::Auth::Basic do |username, password|
      # https://github.com/plashchynski/crono/wiki/Web-UI#rails-http-basic-auth-from-routes
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(username),
        ::Digest::SHA256.hexdigest(Rails.application.env_credentials.crono.username)
      ) & ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(password),
        ::Digest::SHA256.hexdigest(Rails.application.env_credentials.crono.password)
      )
    end

    mount Sidekiq::Web, at: Rails.application.env_credentials.sidekiq.path
    mount Crono::Web, at: Rails.application.env_credentials.crono.path
  else
    mount Sidekiq::Web, at: "/sidekiq"
    mount Crono::Web, at: "/crono"
  end
end
