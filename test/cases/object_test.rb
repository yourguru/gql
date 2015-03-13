require 'cases/helper'

class MyObject < Struct.new(:foo)
end

class ObjectFieldClass < GQL::Field
  call :upcase_foo, -> { target.foo.upcase!; target }
  string :foo
end

class AClass < Struct.new(:a)
end

class BClass < Struct.new(:b)
end

class AClassField < GQL::Field
  string :a
end

class BClassField < GQL::Field
  string :b
end

class FieldWithObject < GQL::Field
  object :object, -> { MyObject.new('bar') }, field_class: ObjectFieldClass
  object :mapped, -> { BClass.new('b') }, field_class: { AClass => AClassField, BClass => BClassField }
end

class ObjectTest < GQL::TestCase
  setup do
    @old_root, GQL.root_field_class = GQL.root_field_class, FieldWithObject
  end

  teardown do
    GQL.root_field_class = @old_root
  end

  test "returns nil without fields" do
    value = GQL.execute('{ object }')

    assert_nil value[:object]
  end

  test "returns its fields" do
    value = GQL.execute('{ object { foo } }')

    assert_equal 'bar', value[:object][:foo]
  end

  test "respects call" do
    value = GQL.execute('{ object.upcase_foo { foo } }')

    assert_equal 'BAR', value[:object][:foo]
  end

  test "object type field with model-to-field mapping as field class" do
    value = GQL.execute('{ mapped { b } }')

    assert_equal 'b', value[:mapped][:b]
  end
end
