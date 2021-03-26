# frozen_string_literal: true

module ActionDispatch
  class TestResponse
    def json_body
      JSON.parse(body).deep_symbolize_keys
    end
  end
end
