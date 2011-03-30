require "spec_helper"
require "thread"

describe FileMonitor::Worker do
  let(:config_path){ File.join(File.dirname(__FILE__),  "..", "..", "fixtures", "config.yml") }
  context "#start_monitor" do
    before do
      @worker = FileMonitor::Worker.new :config_path => config_path
      @worker.config.path = [ File.join( File.dirname(__FILE__), "..", "..", "tmp") ]
    end

    it "should see new files or updated files and run some code"
  end
end
