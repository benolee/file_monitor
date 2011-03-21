lib = File.expand_path('../', __FILE__)
$:.unshift lib unless $:.include?(lib)
require "file_daemon/configuration"
require "file_daemon/worker"
