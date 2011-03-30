require "spec_helper"

describe FileMonitor::CommandLine do
  context "#parse" do
    before :each do
      flexmock( FileMonitor::Core).new_instances do |m|
        m.should_receive(:run).once.and_return{ true }
      end
    end

    after :each do
      flexmock_verify
    end

    context "given a config path and a start/stop command" do
      it "should call FileMonitor::Core" do
        FileMonitor::CommandLine.new ["--config-path", "/tmp/config.yml", "start"]
      end
    end
  end
end
