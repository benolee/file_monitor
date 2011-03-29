require 'rubygems'
require 'bundler/setup'

# Standard libraries
require 'logger'
require 'yaml'

# Gem libraries
require 'fssm'

lib = File.expand_path('../', __FILE__)
$:.unshift lib unless $:.include?(lib)

module FileMonitor
  autoload :Core,              'file_monitor/core'
  autoload :Configuration,     'file_monitor/configuration'
  autoload :Logger,            'file_monitor/logger' # This should go away.. needs to be a hook
  autoload :Worker,            'file_monitor/worker'
  require 'file_monitor/hooks'
end
