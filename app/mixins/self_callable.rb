# frozen_string_literal: true

module SelfCallable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def call(*args)
      new(*args).()
    end
  end
end
