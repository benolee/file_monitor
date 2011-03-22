require "fssm"

module FileMonitor
  class Worker

    def initialize *args
      options = args.last.is_a?(Hash) ? args.pop : {}
    end

    def handle_create base, relative
      # Push this data to the rails app, etc
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

  end # class Worker
end
