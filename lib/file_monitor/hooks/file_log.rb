module FileMonitor
  module Hooks
    class FileLog
      def run *args
        puts args.inspect
      end
    end
  end
end
