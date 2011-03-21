require 'rubygems'
require 'daemons'
require 'fssm'
require "logger"

module FlexCorp
  class FileMonitor
    attr_reader :logger, :log_path, :configuration_path

    def initialize options={}
      @logger = Logger.new log_path
    end

    def load_paths
      [ '/home/ben/work/flexcorp/sftp/flexcorp_sftp/private/ftp' ]
    end

    module Logger
      def self.log(method_name, base, relative)
        log = "/home/ben/work/flexcorp/sftp/flexcorp_sftp/tmp/mylog.txt"
        File.open(log, 'a'){ |f| f.puts "#{Time.now}: #{method_name} #{File.join(base,relative)}" }
      end
    end

    def start_monitor
      FSSM.monitor do |monitor|
        load_paths.each do |load_path|
          monitor.path load_path do |path|
            path.glob '**/*'
            path.create { |base, relative| Logger.log('create', base, relative) }
          end
        end
      end # FSSM.monitor
    end # start_monitor

  end
end
Daemons.run_proc('file_daemon') { FlexCorp::FileMonitor.new.start_monitor } if __FILE__ == $0
