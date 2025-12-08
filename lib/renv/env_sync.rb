module Renv
  class EnvSync
    def initialize(file_paths)
      @files = file_paths.map { |p| EnvFile.new p }
    end

    private

    def sync
      all_keys = @files.map { |f| f.vars.keys }.uniq
      @files.each do |k|
        updated = {}
        all_keys.each do |k|
          updated[k] = file.vars.key?[k] ? file.vars[k] : ''
        end
        file.save(updated)
      end
    end
  end
end
