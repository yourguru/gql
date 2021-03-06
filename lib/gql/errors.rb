require 'active_support/core_ext/array/conversions'
require 'active_support/core_ext/string/inflections'

module GQL
  class Error < RuntimeError
    attr_reader :code, :handle

    def initialize(msg, code = 100, handle = nil)
      @code, @handle = code, handle
      super(msg)
    end

    def as_json
      result = {
        error: {
          code: code,
          type: self.class.name.split('::').last.titleize.downcase
        }
      }

      result[:error][:handle] = handle.to_s if handle
      result[:error][:message] = message if GQL.debug

      result
    end
  end

  module Errors
    class NotFoundError < Error
      private
        def construct_message(field_class, id, name, method)
          items = field_class.send(method).keys.sort.map { |key| "`#{key}'" }

          msg =  "#{field_class} has no #{name} named `#{id}'."
          msg << " Available #{name.pluralize}: #{items.to_sentence}." if items.any?
          msg
        end
    end

    class CallNotFound < NotFoundError
      def initialize(id, field_class)
        msg = construct_message(field_class, id, 'call', :calls)

        super(msg, 111, id)
      end
    end

    class FieldNotFound < NotFoundError
      def initialize(id, field_class)
        msg = construct_message(field_class, id, 'field', :fields)

        super(msg, 112, id)
      end
    end

    class VariableNotFound < NotFoundError
      def initialize(id)
        msg = "The variable named `<#{id}>' has no value."

        super(msg, 113, id)
      end
    end

    class RootClassNotSet < Error
      def initialize
        msg =  "GQL root field class is not set. "
        msg << "Set it with `GQL.root_class = MyRootField'."

        super(msg, 121)
      end
    end

    class InvalidClass < Error
      def initialize(klass, baseclass)
        msg = "#{klass} must be a (subclass of) #{baseclass}."

        super(msg, 123)
      end
    end

    class UnknownFieldType < Error
      def initialize(type, using_class)
        msg =  "The field type `#{type}' used in #{using_class} is not known."
        msg << "Register your field type with: `GQL.field_types[:#{type}] = My#{type.to_s.camelize}'. "
        msg << "The following field types are currently registered: "
        msg << GQL.field_types.keys.sort.map { |key| "`#{key}'" }.to_sentence

        super(msg, 124)
      end
    end

    class ScanError < Error
      def initialize(msg)
        super(msg, 131)
      end
    end

    class SyntaxError < Error
      def initialize(lineno, value, token)
        token = 'character' if token == 'error' || token == %Q{"#{value}"}
        msg = "Unexpected #{token}: `#{value}' (line #{lineno})."

        super(msg, 132, value)
      end
    end
  end
end
