module Renv
  module Generators 
    class BaseGenerator
      def initialize(schema)
        @schema = schema
      end
      
      def type_of(key)
        @schema[key] || :string
      end

      def keys()
        @schema.keys
      end
    end
  end
end
