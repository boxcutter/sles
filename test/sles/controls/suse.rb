if os.suse?
  describe command('date') do
    its('stdout') { should match('UTC') }
  end

  describe user('vagrant') do
    it { should exist }
  end

  describe file('/etc/sudoers') do
    its('content') { should match('vagrant ALL=\(ALL\) NOPASSWD: ALL') }
  end

  describe package('vim') do
    it { should be_installed }
  end

  if virtualization.system == 'vbox'
    # File resource doesn't support wildcards, so instead scrape ls output
    describe command('ls /home/vagrant/*.iso') do
      its('stdout') { should eq '' }
    end
  end
end
