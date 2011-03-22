module FileMonitor
  class Worker

    attr_reader :glob, :path

    def initialize *args
      options = args.last.is_a?(Hash) ? args.pop : {}

      @path = options[:path]
      @glob = options[:glob] || '**/*'
    end

  end
end
