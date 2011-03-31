# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'file_monitor/version'

Gem::Specification.new do |s|
  s.name        = "file_monitor"
  s.version     = FileMonitor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Cook", "Ben Holley"]
  s.email       = ["james@isotope11.com"]
  s.summary     = %q{Wrapper around FSSM for ease of use"}
  #s.description = %q{}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "file_monitor"

  s.add_dependency "rb-inotify"
  s.add_dependency "daemons"
  s.add_dependency "fssm"
  s.add_dependency "trollop"
  s.add_development_dependency "rspec"
  s.add_development_dependency "flexmock"

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables        = %w(file_monitor)
  s.default_executable = "file_monitor"
  s.require_paths      = ["lib"]
end
