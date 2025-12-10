module Renv
  class EnvSync
    def initialize(file_paths)
      @files = file_paths.map { |p| EnvFile.new p }
    end

    def sync
      all_keys = @files.flat_map { |f| f.vars.keys }.uniq
      @files.each do |file|
        updated = {}
        all_keys.each do |k|
          updated[k] = file.vars.key? k ? file.vars[k] : ''
        end
        file.save(updated)
      end
    end
  end
end
