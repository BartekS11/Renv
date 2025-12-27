module Renv
  module Generators 
    class RustGenerator < BaseGenerator
      RUST_TYPES = {
        string: "String",
        integer: "i32",
        boolean: "bool"
      }

      def generate(path)
        content =
          "#[derive(Debug, serde::Deserialize)]\n" \
          "pub struct Config {\n"

        keys.each do |key|
          rust_key = key.to_lowercase rescue key.downcase
          rust_type = RUST_TYPES[type_of(key)] || :string

          content << "  pub #{rust_key}: #{rust_type},\n"
        end

        content << "}\n"

        File.write(path, content)
      end
    end
  end
end
