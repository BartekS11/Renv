module Renv
  module Generators
    class Codegen
      LANG_ALIASES = {
        'go' => 'go',
        'golang' => 'go',
        'ts' => 'ts',
        'typescript' => 'ts',
        'py' => 'python',
        'python' => 'python',
        'rs' => 'rust',
        'rust' => 'rust'
      }.freeze

      LANG_EXTENSIONS = {
          'go' => 'go',
          'golang' => 'go',
          'ts' => 'ts',
          'typescript' => 'ts',
          'py' => 'py',
          'python' => 'py',
          'rs' => 'rs',
          'rust' => 'rs'
        }.freeze

      def self.define_lang_extension(lang)
        raise "Unsupported language #{lang}" unless LANG_EXTENSIONS.key?(lang.downcase)

        return LANG_EXTENSIONS[lang.downcase]
      end

      def self.run(lang, schema, output)
        lang = LANG_ALIASES[lang.downcase]

        generator =
          case lang
          when 'ts'    then Generators::TsGenerator.new(schema)
          when 'go'    then Generators::GoGenerator.new(schema)
          when 'rust'  then Generators::RustGenerator.new(schema)
          when 'python' then Generators::PythonGenerator.new(schema)
          else
            raise "Unsupported language: #{lang}"
          end

        generator.generate(output)
      end
    end
  end
end
