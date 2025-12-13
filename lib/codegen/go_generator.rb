module Renv
  module Generators 
    class GoGenerator < BaseGenerator
      GO_TYPES = {
        string: 'string',
        number: 'int',
        boolean: 'bool'
      }
      def generate(path)
        content = "package env\n\n"
        content << "type Config struct {\n"

        keys.each do |key|
          go_name = key.capitalize
          go_type = GO_TYPES[type_of(key)]

          content << "  #{go_name} #{go_type} `env:\"#{key}\"`\n"
        end

        content << "}\n"

        File.write(path, content)
      end
    end
  end
end
