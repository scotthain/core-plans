title 'Tests to confirm memcached exists'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'memcached')

control 'core-plans-memcached-exists' do
  impact 1.0
  title 'Ensure memcached exists'
  desc '
  Verify memcached by ensuring bin/memcached 
  (1) exists and
  (2) is executable'
  
  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
    its('stderr') { should be_empty }
  end

  command_full_path = File.join(plan_installation_directory.stdout.strip, "bin", "memcached")
  describe file(command_full_path) do
    it { should exist }
    it { should be_executable }
  end
end
