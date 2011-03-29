lib = File.expand_path('../', __FILE__)
$:.unshift lib unless $:.include?(lib)

module FileMonitor
  module Hooks
    autoload :StandardOutput, 'hooks/standard_output.rb'
    autoload :FileLog, 'hooks/file_log.rb'
  end
end
