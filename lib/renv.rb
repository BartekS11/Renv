require 'thor'
require 'pastel'

require_relative 'renv/env_sync'
require_relative 'renv/env_file'
require_relative 'renv/env_diff'
require_relative 'renv/env_types'
require_relative 'renv/cli'

require_relative 'codegen/base_generator'
require_relative 'codegen/codegen'
require_relative 'codegen/go_generator'
require_relative 'codegen/ts_generator'
require_relative 'codegen/python_generator'

module Renv
  VERSION = '0.1.1'
end
