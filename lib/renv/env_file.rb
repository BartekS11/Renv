module Renv
  class EnvFile
    attr_reader :path, :vars

    def initialize(path)
      @path = path
      @lines = File.exist?(path) ? File.readlines(path, chomp: true) : []
      @vars = parse_lines @lines
    end

    def parse_lines(lines)
      lines
        .map(&:strip)
        .reject { |l| l.start_with?('#') || l.empty? }
        .map { |line| line.split('=', 2) }
        .map { |k, v| [k, v || ''] }
        .to_h
    end

    def save(vars)
      content = vars.map { |k, v| "#{k}=#{v}" }.join("\n")
      File.write(path, "#{content}\n")
    end
  end
end
