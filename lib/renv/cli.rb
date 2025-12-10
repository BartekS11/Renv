module Renv
  class CLI < Thor
    desc 'sync FILES...', 'Sync keys across multiple .env files (need to provide at least one)'
    def sync(*files)
      return puts 'Please provide at least one .env file to synchronize' if files.empty?

      Renv::EnvSync.new(files).sync
      puts "Synced: #{files.join(', ')}"
    end

    desc 'generate_types', 'Generate TypeScript definitions from a .env file'
    option :input, default: '.env', desc: 'Input env file (default: .env)'
    option :output, default: 'src/env.d.ts', desc: 'Output TypeScript file'
    def generate_types
      EnvTypes.new(options[:input]).generate(options[:output])
      puts 'Generated TypeScript definitions at: #{options[:output]}'
    end

    desc 'diff FILE_A FILE_B', 'Compare two .env files and show differences'
    def diff(file_a, file_b)
      d = EnvDiff.new(file_a, file_b).diff
      puts "Only in #{file_a}: #{d[:only_in_a].join(', ')}" unless d[:only_in_a].empty?
      puts "Only in #{file_b}: #{d[:only_in_b].join(', ')}" unless d[:only_in_b].empty?
      puts "Different values: #{d[:missmatched_values].join(', ')}" unless d[:missmatched_values].empty?

      puts 'No differences found.' if d[:only_in_a].empty? && d[:only_in_b].empty? && d[:missmatched_values].empty?
    end
  end
end
