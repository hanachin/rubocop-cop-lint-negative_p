require "rubocop"
require "rubocop/cop/lint/positive_p/version"

module RuboCop
  module Cop
    module Lint
      class PositiveP < Cop
        MSG = "Do not use Numeric#positive?"

        def_node_matcher :positive?, <<-PATTERN
          (send _ :positive?)
        PATTERN

        def self.support_target_ruby_version?(version)
          version < 2.3
        end

        def on_send(node)
          return unless positive?(node)

          add_offense(node)
        end
      end
    end
  end
end
