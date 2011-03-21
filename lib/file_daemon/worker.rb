require "fssm"
module FlexCorp
  module FileMonitor
    class Worker
      attr_reader :config
      def initialize options={}
        @config = Configuration.new options[:config_path]
      end

      def logger
        @logger ||= Logger.new(STDOUT)
      end

      def handle_create base, relative
        # Push this data to the rails app, etc
        logger.warn(['create', base, relative].inspect)
      end

      def start_monitor
        FSSM.monitor do |monitor|
          config.path.each do |load_path|
            monitor.path load_path do |path|
              path.glob '**/*'
              #path.create { |base, relative| Logger.log('create', base, relative) }
              path.create { |base, relative| handle_create }
            end
          end
        end # FSSM.monitor
      end # start_monitor
    end # class
  end
 end

#Daemons.run_proc('file_daemon') { FlexCorp::FileMonitor::Worker.new.start_monitor } if __FILE__ == $0
