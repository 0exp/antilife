# frozen_string_literal: true

# @api private
# @since 0.1.0
class Siege::System::Element
  require_relative 'element/name_guard'
  require_relative 'element/factory'

  # @return name [String]
  #
  # @api private
  # @since 0.1.0
  attr_reader :name

  # @return [Siege::System::Loader]
  #
  # @api private
  # @since 0.1.0
  attr_reader :loader

  # @param name [String]
  # @param loader [Siege::System::Loader]
  # @return [void]
  #
  # @api private
  # @since 0.1.0
  def initialize(name, loader)
    @name = Siege::System::Element::NameGuard.indifferently_accesable_name(name)
    @lock = Siege::Core::Lock.new
    @entities = Siege::Core::Container.new
    @loader = loader
  end

  private

  # @return [Siege::System::Element::Container]
  #
  # @api private
  # @sinec 0.1.0
  attr_reader :entities

  # @param block [Block]
  # @return [Any]
  #
  # @api private
  # @since 0.1.0
  def thread_safe(&block)
    @lock.synchronize(&block)
  end
end
