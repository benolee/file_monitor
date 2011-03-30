require "spec_helper"
describe FileMonitor::Configuration do
  context "#new" do
    context "given a valid path" do
      let(:config_path){ File.join(File.dirname(__FILE__),  "..", "..", "fixtures", "config.yml") }
      it "should parse and have convenience methods for each settings" do
        @config = FileMonitor::Configuration.new :config_path => config_path
        @config.data.should be_an_instance_of(Hash)
        @config.data["logfile"].should be_an_instance_of(Hash)
        @config.data["monitor"].should be_an_instance_of(Hash)
        @config.data["logfile"]["path"].should be_an_instance_of(String)
        @config.data["monitor"]["path"].should be_an_instance_of(String)
      end
    end
  end
end
