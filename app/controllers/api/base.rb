# frozen_string_literal: true

module API
  class Base < Grape::API
    include Dry::Monads[:result]

    if Rails.env.development? || Rails.env.staging?
      insert_after Grape::Middleware::Formatter, Grape::Middleware::Logger, { headers: :all }
    end

    mount API::V1::Base
  end
end
