# frozen_string_literal: true

module API
  module V1
    module Helpers
      module Response
        def ok!(body = {})
          status :ok
          body
        end

        def created!(body = {})
          status :created
          body
        end

        def bad_request!(errors = [])
          error!({ errors: [errors].flatten }, 400)
        end

        def not_found!(error = "Resource not found")
          error!({ errors: [error] }, 404)
        end

        def unauthorized!(error = "Unauthorized")
          error!({ errors: [error] }, 401)
        end
      end
    end
  end
end
