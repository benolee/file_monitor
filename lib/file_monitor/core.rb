module FileMonitor
  class Core
    attr_reader   :hooks
    attr_accessor :config
    def initialize *args
      args.flatten!
      options = args.last.is_a?(Hash) ? args.pop : {}
      @hooks  = []
      @config = FileMonitor::Configuration.new(:config_path => options[:config_path], :watch_dir => options[:watch_dir])
    end

    def add_hook klass, call_method=:run
      @hooks.push [klass, call_method]
      self
    end

    def remove_hook klass
      @hooks.delete_if{|k,m| k.to_s == klass.to_s }
      self
    end

    def run
      _self = self
      FSSM.monitor(config.watch_dir) do
        update{|base, relative| _self.hook!(:update, base, relative) }
        delete{|base, relative| _self.hook!(:delete, base, relative) }
        create{|base, relative| _self.hook!(:create, base, relative) }
      end
    end

    def hook! event, *args
      if hooks.empty?
        hooks.push default_hook
      end
      hooks.map{|klass, call_method| FileMonitor::Hooks.const_get(klass).send(call_method, *[event, args]) }
    end

    private
    def default_hook
      ["StandardOutput", "run"]
    end
  end
end
