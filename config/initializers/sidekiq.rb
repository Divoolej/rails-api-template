# frozen_string_literal: true

unless Rails.env.development? || Rails.env.test?
  Sidekiq.configure_server do |config|
    config.redis = { url: Rails.application.env_credentials.redis_url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: Rails.application.env_credentials.redis_url }
  end
end
