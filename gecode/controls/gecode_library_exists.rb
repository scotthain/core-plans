title 'Tests to confirm gecode library exists'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'gecode')

control 'core-plans-gecode-library-exists' do
  impact 1.0
  title 'Ensure gecode library exists'
  desc '
  Verify gecode library by ensuring that
  (1) its installation directory exists;
  (2) the library exists;
  (3) one of its executables returns the expected version
  '

  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end

  library_filename = input('library_filename', value: 'libgecodeflatzinc.so')
  library_full_path = File.join(plan_installation_directory.stdout.strip, 'lib', library_filename)
  describe file(library_full_path) do
    it { should exist }
  end

  plan_pkg_version = plan_installation_directory.stdout.split("/")[5]
  command_full_path = File.join(plan_installation_directory.stdout.strip, "bin", "fz")
  describe command("#{command_full_path} --help 2>& 1") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /Version:\s+#{plan_pkg_version}/ }
  end
end
