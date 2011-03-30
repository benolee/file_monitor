module FileMonitor
  class Configuration
    attr_accessor :logfile_path, :watch_dir
    attr_reader   :data
    def initialize *args
      options        = args.last.is_a?(Hash) ? args.pop : {}
      config_path    = options[:config_path]
      config_content = ::File.exist?(config_path.to_s) ? YAML.load_file(config_path) : {"logfile" => {}, "monitor" => {}}
      @data           = config_content
    end
  end
end
