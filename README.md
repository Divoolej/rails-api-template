# Divoolej's Rails API template

Rails app generated with:
```shell
rails new rails-api-template \
  --database=postgresql \
  --skip-action-mailbox \
  --skip-active-storage \
  --skip-action-cable \
  --skip-action-text \
  --skip-system-test \
  --skip-javascript \
  --skip-turbolinks \
  --skip-jbuilder \
  --skip-test \
  --api
```

## What's in the box?
- Rails API
- Grape (with grape-entity and Swagger support)
- Sidekiq
- Crono
- dry-monads + takes_macro
- A couple of linters and utilities

## Getting Started
1) Change the application name (APP_NAME) in :
- `config/application.rb`
- `config/initializers/swagger.rb`
- `config/initializers/uptime.rb`
- `config/database.yml`
- `docker/docker-compose.yml`
- `app/controllers/api/v1/base.rb:16`
- `app/controllers/api/v1/system/uptime.rb:15`
- `spec/controllers/api/v1/system/uptime_spec.rb:17`
2) Adjust the database configuration in `config/database.yml`.
3) Select optional gems from the Gemfile, remove the rest.
4) Initialize credentials with `rails credentials:edit --environment=development`
