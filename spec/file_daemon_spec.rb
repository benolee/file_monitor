require 'spec_helper'

describe FileMonitor do
  describe FileMonitor::Core do
    before do
      @monitor = FileMonitor::Core.new [{}]
    end
    context "#add_hook" do
      it "should register a hook" do
        @monitor.add_hook "Klass", :run
        @monitor.hooks.last.should == ["Klass", :run]
      end
    end

    context "#remove_hook" do
      it "should unregister a hook" do
        @monitor.add_hook "Klass", :run
        @monitor.remove_hook "Klass"
        @monitor.hooks.should be_empty
      end
    end

    context "#hook!" do
      before do
        @io = StringIO.new
        FileMonitor::Hooks::StandardOutput.io = @io
      end

      it "should fire the run method on registered hooks" do
        @monitor.hook! [:update, "x", "y"]  # Simulate what FSSM passes in when a file gets modified or created
        @io.rewind
        @io.read.should == "[[:update, \"x\", \"y\"], []]\n"
      end
    end
  end
end
