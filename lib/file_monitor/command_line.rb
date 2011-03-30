module FileMonitor
  class CommandLine
    def initialize argv=[]
      require 'trollop'
      parse self, argv if argv.any?
    end

    def file_monitor_banner
<<-EOT
Usage: file_monitor -c /path/to/config.yml COMMAND [ARGS]

The file monitor commands are:
 start          Starts the file monitor and watches a specified directory.
 stop           Stops the file monitor
 --version
EOT
    end

    def available_commands
      %w(start stop)
    end

    def parse _self, argv
      global_opts = Trollop::options(argv) do
        banner _self.file_monitor_banner
        opt :config_path, "Configuration Path", :short => "-c", :type => :string
        stop_on _self.available_commands
      end

      command  = argv.shift # get the subcommand
      cmd_opts = case command
        when "start"
          Trollop::options(argv) do
            opt :config_path, "Configuration Path", :short => "c"
          end

          watch_dir   = argv.unshift
          config_path = global_opts[:config_path]
          FileMonitor::Core.new(:config_path => config_path, :watch_dir => File.expand_path(File.join(watch_dir))).run
        when "stop"
        else
          Trollop::die "unknown command #{command.inspect}"
        end
    end
  end
end
