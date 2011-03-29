module FileMonitor
  module Hooks
    class StandardOutput
      # This is the default hook. Writes CREATE, UPDATE and DELETE events to STDOUT
      def self.run *args
        io.puts args.inspect
      end

      def self.io
        @io = STDOUT if @io.nil?
        @io
      end

      def self.io= _io
        @io = _io # Set to a file, StringIO, etc. StringIO is used for specs.
      end
    end
  end
end
