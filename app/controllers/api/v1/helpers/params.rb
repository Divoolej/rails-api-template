# frozen_string_literal: true

module API
  module V1
    module Helpers
      module Params
        def safe_params
          declared(params, include_missing: false)
        end
      end
    end
  end
end
