# frozen_string_literal: true

module API
  module V1
    module System
      class Base < API::V1::Base
        namespace :system do
          mount Uptime
          mount Health
        end
      end
    end
  end
end
