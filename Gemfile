# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Fundamentals:

# Use rails as the application framework
gem "rails", "~> 6.1.3"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.2.3"
# Use Puma as the app server
gem "puma", "~> 5.2.2"
# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.16"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.7.2", require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors", "~> 1.1.1"
# Use grape as the API framework
gem "grape", "~> 1.5.2"
# Use grape-entity for JSON serialization in Grape
gem "grape-entity", "~> 0.8.2"
# grape-middleware-logger provides better logs for requests
gem "grape-middleware-logger"
# Use dry-monads to improved reliability of service objects
gem "dry-monads", "~> 1.3.5"
# Use takes_macro for nicer initialization of service objects
gem "takes_macro", "~> 1.0.1"

# Optional goodies:

# Use Sidekiq for background job processing
gem "sidekiq", "~> 6.2.0"
# Use Redis as the cache store
gem "redis", "~> 4.2.5"
# Use Crono as a scheduler
gem "crono", "~> 1.1.2"
# Haml is required for Crono's web UI
gem "haml", "~> 5.2.1"
# Sinatra is required for Crono's web UI
gem "sinatra", "~> 2.1.0", require: false
# # Use kaminari for pagination
# gem "kaminari"
# # Use shrine to handle file uploads
# gem "shrine", "~> 3.0"


# Third-party integrations:

# # Use new relic for performance analytics
# gem "newrelic_rpm"
# # Use aws-sdk-s3 to upload to S3-compatible cloud storage
# gem "aws-sdk-s3", "~> 1.14"
# # Use sentry for error monitoring
# gem "sentry-ruby"
# gem "sentry-rails"
# # Use Twilo for SMS & push notifications
# gem "twilio-ruby"
# # Use Sendgrid for email communication
# gem "sendgrid-actionmailer"

group :staging do
  # Use rack_password for basic auth on staging
  gem "rack_password", "~> 1.3"
end

group :development, :staging do
  # Use swagger for generating API documentation
  gem "grape-swagger", "~> 1.3.1"
  # Use grape-swagger-rails to display swagger documentation
  gem "grape-swagger-rails", "~> 0.3.1"
  # Use grape-swagger-entity to generate entity documentation in swagger
  gem "grape-swagger-entity", "~> 0.5.1"
end

group :development do
  # Use listen to enable notification-based file system watching instead of long polling
  gem "listen", "~> 3.4.1"
  # Preview email in development using letter_opener with a handy web UI
  gem "letter_opener_web", "~> 1.4.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "~> 2.1.1"
  # Use rubocop to lint code
  gem "rubocop", "1.11.0", require: false
  # Allow Spring to use the Listen gem
  gem "spring-watcher-listen", "~> 2.0.1"
  # Use active_record_doctor to check the database schema for issues
  gem "active_record_doctor", "~> 1.7.1", require: false
  # Use lol_dba to detect missing / unnecessary database indexes
  gem "lol_dba", "~> 2.2.0", require: false
end

group :development, :test do
  # Bullet helps detect N+1 queries and other eager loading issues
  gem "bullet", "~> 6.1.4"
  # Use factory_bot for writing fixtures
  gem "factory_bot_rails", "~> 6.1.0"
  # Use faker to generate better lookin test data
  gem "faker", "~> 2.16.0"
  # Call "binding.pry" anywhere in the code to stop execution and get a debugger console
  gem "pry-byebug", "~> 3.9.0"
  # Replace the default rails console with pry
  gem "pry-rails", "~> 0.3.9"
end

group :test do
  # Use brakeman for static security analysis
  gem "brakeman", "~> 5.0.0", require: false
  # Use bundler-audit to check dependencies for security issues
  gem "bundler-audit", "~> 0.7.0.1", require: false
  # Use RSpec as the testing framework
  gem "rspec-rails", "~> 4.0.2"
  # Use shoulda-matchers for testing common Rails functionality
  gem "shoulda-matchers", "~> 4.5.1"
  # Use simplecov for measuring code coverage
  gem "simplecov", "~> 0.21.2", require: false
end
