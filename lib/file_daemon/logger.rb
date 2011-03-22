require 'logger'
require File.expand_path('../../core_ext/array/extract_options.rb', __FILE__)

module FlexCorp
  class Logger < ::Logger
    def initialize *args
      options = args.extract_options!
      logdev = options.delete(:logdev)

      if logdev
        super(logdev)
      end

    end
  end
end

