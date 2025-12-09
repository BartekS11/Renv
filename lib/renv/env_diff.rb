module Renv
  class EnvDiff
    def initialize(file_a, file_b)
      @a = EnvFile.new(file_a).vars
      @b = EnvFile.new(file_b).vars
    end

    def diff
      {
        only_in_a: @a.keys - @b.keys,
        only_in_b: @b.keys - @a.keys,
        missmatched_values: @a.keys.select { |k| @b.key?(k) && @a[k] != @b[k] }
      }
    end
  end
end
