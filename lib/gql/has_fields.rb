require 'active_support/concern'
require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/class/subclasses'
require 'active_support/core_ext/string/inflections'

module GQL
  module HasFields
    extend ActiveSupport::Concern

    included do
      class_attribute :fields, :field_proc, instance_accessor: false, instance_predicate: false
      self.fields = {}
    end

    module ClassMethods
      def add_field(id, *args, &block)
        remove_field id

        id          = id.to_sym
        options     = args.extract_options!
        type        = options.delete(:type) || Field
        proc        = args.shift || block || proc_for_field(id)
        const_name  = const_name_for_field(id)
        field_class = build_field_class(type, id, proc, options)

        send :remove_const, const_name if const_defined?(const_name, false)

        field_class.tap do |fc|
          const_set const_name, fc
          self.fields = fields.merge(id => fc)
          descendants.each { |f| f.fields[id] = fc }
        end
      end

      alias :field :add_field

      def remove_field(id)
        id = id.to_sym
        const_name = const_name_for_field(id)

        [self, *descendants].each do |f|
          next unless f.has_field? id

          f.send :remove_const, const_name if f.const_defined?(const_name, false)
          f.fields.delete id
        end
      end

      def has_field?(id)
        fields.has_key? id.to_sym
      end

      def cursor(id_or_proc)
        id = id_or_proc.is_a?(Proc) ? nil : id_or_proc
        proc = id ? -> { target.public_send(id) } : id_or_proc

        add_field :cursor, proc, type: Scalar
      end

      def respond_to?(method, *args)
        super || GQL.field_types.has_key?(method)
      end

      def method_missing(method, *args, &block)
        if type = GQL.field_types[method]
          define_field_method method, type
          send method, *args, &block
        else
          super
        end
      rescue NoMethodError => exc
        raise Errors::NoMethodError.new(self, method, exc)
      end

      private
        def build_field_class(type, id, proc, options)
          if type.is_a? ::String
            Lazy.build_class id, proc, options.merge(owner: self, type: type)
          else
            Registry.fetch(type).build_class id, proc, options
          end
        end

        def const_name_for_field(id)
          prefix = id == :__type__ ? 'Schema_Type' : id.to_s.camelize
          :"#{prefix}Field"
        end

        def proc_for_field(id)
          instance_exec id, &(field_proc || GQL.default_field_proc)
        end

        def define_field_method(name, type)
          Field.define_singleton_method name do |*args, &block|
            options = args.extract_options!.merge(type: type)
            args = args.push(options)

            add_field(*args, &block)
          end
        end
    end

    private
      def value_of_fields(ast_fields)
        ast_fields.reduce({}) do |result, ast_field|
          key = ast_field.alias_id || ast_field.id

          result.merge key => value_of_field(ast_field)
        end
      end

      def value_of_field(ast_field)
        if ast_field.id == :node
          field = self.class.new(ast_field, target, variables, context)
          field.value
        else
          field_class = field_class_for_id(ast_field.id)
          next_target = target_for_field(target, field_class.proc)

          field = field_class.new(ast_field, next_target, variables, context)
          field.value
        end
      end

      def field_class_for_id(id)
        self.class.fields[id] or raise Errors::FieldNotFound.new(id, self.class)
      end

      def target_for_field(current_target, proc)
        args = [current_target, context]
        args.push self.class if GQL.debug

        method = self.class.const_get(:ExecutionContext).new(*args)
        method.execute proc
      end

      class ExecutionContextNoDebug < Struct.new(:target, :context)
        def execute(method, args = [])
          instance_exec(*args, &method)
        end
      end

      class ExecutionContextDebug < Struct.new(:target, :context, :field_class)
        def execute(method, args = [])
          instance_exec(*args, &method)
        end
      end
  end
end
