# frozen_string_literal: true

case ENV["APPLICATION"]
when "rails"
  system("bundle exec rails db:create", exception: true)
  system("bundle exec rails db:migrate", exception: true)
  exec("bundle exec rails server")
when "sidekiq"
  exec("bundle exec sidekiq")
else
  raise "APPLICATION env var is not set!"
end
