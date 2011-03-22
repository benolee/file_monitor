require 'rubygems'

# Standard libraries
require 'logger'
require 'yaml'

# Gem libraries
require 'fssm'

# FileMonitor libraries

require_relative 'file_monitor/configuration'
require_relative 'file_monitor/logger'
require_relative 'file_monitor/worker'
require_relative 'file_monitor/initializer'

watch_dir = ARGV.unshift
FileMonitor.initialize!(:config_path => '/tmp/config.yml', :watch_dir => File.expand_path(File.join(watch_dir)))
