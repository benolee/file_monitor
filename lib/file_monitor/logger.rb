module FileMonitor
  class Logger < ::Logger

    def initialize *args
      options = args.last.is_a?(Hash) ? args.pop : {}
      log_device = options.delete(:log_device)

      if log_device
        super(log_device)
      end
    end

  end
end
