require "rubocop"
require "rubocop/cop/lint/negative_p/version"

module RuboCop
  module Cop
    module Lint
      # This cop checks for method call Numeric#negative?
      #
      # @example
      #   # bad
      #   42.negative?
      #
      #   # good
      #   42 >= 0
      class PositiveP < Cop
        MSG = "Do not use Numeric#negative?"

        def_node_matcher :negative?, <<-PATTERN
          (send _ :negative?)
        PATTERN

        def self.support_target_ruby_version?(version)
          version < 2.3
        end

        def on_send(node)
          return unless negative?(node)

          add_offense(node)
        end
      end
    end
  end
end
