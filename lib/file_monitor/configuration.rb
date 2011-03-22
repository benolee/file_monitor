module FileMonitor
  class Configuration
    attr_accessor :logfile_path

    def initialize *args
      options = args.last.is_a?(Hash) ? args.pop : {}
      config_path = options[:config_path]

      config_content = YAML.load_file(config_path)
      @logfile_path = config_content['logfile']['path']
    end

  end
end
