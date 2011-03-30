require "spec_helper"
describe FileMonitor::Configuration do
  context "#new" do
    context "given a valid path" do
      let(:config_path){ File.join(File.dirname(__FILE__),  "..", "..", "fixtures", "config.yml") }
      it "should parse and have convenience methods for each settings" do
        @config = FileMonitor::Configuration.new config_path
        @config.should respond_to(:user)
        @config.should respond_to(:password)
        @config.should respond_to(:path)
      end
    end

    context "given a invalid path" do
      it "should raise FileNotFoundError" do
        lambda{ FileMonitor::Configuration.new("/invalid/path") }.should raise_error(Errno::ENOENT)
      end
    end
  end
end
