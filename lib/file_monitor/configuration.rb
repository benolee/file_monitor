module FileMonitor
  class Configuration
    attr_accessor :logfile_path, :watch_dir
    def initialize *args
      options        = args.last.is_a?(Hash) ? args.pop : {}
      config_path    = options[:config_path]
      config_content = ::File.exist?(config_path.to_s) ? YAML.load_file(config_path) : {"logfile" => {}, "monitor" => {}}
      @logfile_path  = config_content['logfile']['path']
      @watch_dir     = config_content['monitor']['path'] || options[:watch_dir]
    end
  end
end
