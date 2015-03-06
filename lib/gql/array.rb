require 'active_support/core_ext/class/attribute'

module GQL
  class Array < Field
    class_attribute :item_class, instance_accessor: false, instance_predicate: false

    class << self
      def build_class(id, body, options = {})
        item_class = options[:item_class] || self.item_class

        Node.validate_is_subclass! item_class, 'item'

        Class.new(self).tap do |field_class|
          field_class.id = id.to_s
          field_class.body = body
          field_class.item_class = item_class
        end
      end
    end

    call :size, Number, -> { target.size }

    def value
      target.map do |item|
        node = self.class.item_class.new(ast_node, item, variables, context)
        node.value
      end
    end
  end
end
