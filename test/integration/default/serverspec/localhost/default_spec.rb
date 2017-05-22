require 'spec_helper'

[8126, 8127].each do |p|
  describe port(p) do
    it { should be_listening }
  end
end

describe service('veneur') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/log/veneur/veneur.log') do
  it { should be_file }
end