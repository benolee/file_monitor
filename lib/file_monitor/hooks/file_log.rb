module FileMonitor
  module Hooks
    class FileLog
      def self.run *args
        io << args.inspect
      end

      def self.io
        require "logger"
        @io = ::Logger.new(log_path)
      end

      def self.log_path=(path)
        @log_path = path
      end

      def self.log_path; @log_path; end
    end
  end
end
