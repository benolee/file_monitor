require "yaml"

module FlexCorp
  module FileMonitor
    class Configuration
      attr_reader :path
      def initialize path
        @path = path
        yaml = parse @path
        methodize yaml
      end

      def methodize hash
        hash.each_pair{|k,v| instance_variable_set("@#{k}",v); self.class.send(:attr_accessor, k.to_sym) }
      end
      protected
      def parse _path
        YAML.load_file path
      end
    end
  end
 end
