# frozen_string_literal: true

class ApplicationService
  extend TakesMacro
  include SelfCallable
  include Dry::Monads[:result, :do]
end
