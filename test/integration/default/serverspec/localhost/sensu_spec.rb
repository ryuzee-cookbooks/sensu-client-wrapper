require 'spec_helper'

%w{sensu}.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

%w{sensu-client}.each do |p|
  describe service(p) do
    it { should be_enabled }
    it { should be_running }
  end
end
