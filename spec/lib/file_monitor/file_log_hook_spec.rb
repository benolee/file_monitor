require 'spec_helper'
require 'tempfile'

describe FileMonitor do
  describe FileMonitor::Hooks::FileLog do
    before do
      @monitor = FileMonitor::Core.new [{}]
      @file = Tempfile.new "sample_file_monitor_hook"
      FileMonitor::Hooks::FileLog.log_path = @file.path
      @monitor.add_hook "FileLog", :run
    end

    context "#hook!" do

      it "should fire the run method on registered hooks" do
        @monitor.hook! [:update, "x", "y"]
        @file.rewind
        @file.read.should == "[[:update, \"x\", \"y\"], []]"
      end
    end
  end
end
