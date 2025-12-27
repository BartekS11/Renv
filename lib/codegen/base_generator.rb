module Renv
  module Generators 
    class BaseGenerator
      BOOLEAN_REGEX = /^(true|false|yes|no)$/i
      INTEGER_REGEX = /^-?\d+$/
      FLOAT_REGEX   = /^-?\d+\.\d+$/

      def initialize(schema)
        @schema = schema.transform_keys(&:to_s)
      end
      
      def type_of(key)
        puts detect_type(@schema[key.to_s])
        return detect_type(@schema[key.to_s]) if @schema.key?(key.to_s)
      end

      def keys()
        @schema.keys
      end

      private

      def detect_type(value)
        case value.to_s.strip
        when BOOLEAN_REGEX then :boolean
        when INTEGER_REGEX then :integer
        when FLOAT_REGEX then :float
        else :string
        end
      end
    end
  end
end
