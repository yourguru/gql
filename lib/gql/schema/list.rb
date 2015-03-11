module GQL
  module Schema
    class List < GQL::Node
      call :count, returns: GQL::Number
      number :count

      call :reverse
      call :first, -> size { target.first(size) }
    end
  end
end
