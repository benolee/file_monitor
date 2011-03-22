module FileMonitor
  class << self
    attr_accessor :logger, :config

    def initialize!(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}

      @config = FileMonitor::Configuration.new(:config_path => options[:config_path], :watch_dir => options[:watch_dir])
      @logger = FileMonitor::Logger.new(:log_device => config.logfile_path)
      FSSM.monitor(config.watch_dir) do
        update {|base, relative| FileMonitor.logger << "#{Time.now}: UPDATE #{base}/#{relative}\n" }
        delete {|base, relative| FileMonitor.logger << "#{Time.now}: DELETE #{base}/#{relative}\n" }
        create {|base, relative| FileMonitor.logger << "#{Time.now}: CREATE #{base}/#{relative}\n" }
      end
    end
  end
end
