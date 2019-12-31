# frozen_string_literal: true

module Siege::System
  # @api public
  # @since 0.1.0
  Error = Class.new(Siege::Error)

  # @api public
  # @since 0.1.0
  ArgumentError = Class.new(Siege::ArgumentError)

  # @api public
  # @since 0.1.0
  AmbiguousElementStatusError = Class.new(Error)
end
