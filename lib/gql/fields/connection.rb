require 'active_support/core_ext/class/attribute'

module GQL
  module Fields
    class Connection < Field
      class_attribute :connection_class, instance_accessor: false, instance_predicate: false

      class << self
        def build_class(method, connection_class, node_class)
          connection_class ||= self.connection_class

          raise Errors::UndefinedNodeClass.new(self, 'connection') if connection_class.nil?
          raise Errors::InvalidNodeClass.new(connection_class, GQL::Connection) unless connection_class <= GQL::Connection

          Class.new(self).tap do |field_class|
            field_class.method = method
            field_class.connection_class = connection_class.build_class(node_class)
          end
        end
      end

      def value_of_fields(*)
        connection = self.class.connection_class.new(ast_node, target, variables, context)
        connection.value
      end

      def raw_value
        nil
      end
    end
  end
end
