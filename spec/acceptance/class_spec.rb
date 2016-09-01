require 'spec_helper_acceptance'

describe 'jchkmail class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'jchkmail': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_failures => true)
    end


    describe user('jchkmail') do
      it { should exist }
    end

    describe group('jchkmail') do
      it { should exist }
    end

    describe file('/etc/jchkmail/j-chkmail.cf') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'root'}
      it { should be_grouped_into 'root'}
    end

    describe file('/etc/jchkmail/j-ndc.cf') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'root'}
      it { should be_grouped_into 'root'}
    end

    describe file('/etc/jchkmail/cdb/j-bayes.db') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'root'}
      it { should be_grouped_into 'root'}
    end

    describe file('/etc/jchkmail/cdb/j-policy.db') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'root'}
      it { should be_grouped_into 'root'}
    end

    describe file('/etc/jchkmail/cdb/j-urlbl.db') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'root'}
      it { should be_grouped_into 'root'}
    end

    describe file('/etc/jchkmail/cdb/j-rcpt.db') do
      it { should be_file }
      it { should be_mode 644 }
      it { should be_owned_by 'root'}
      it { should be_grouped_into 'root'}
    end

    describe file('/var/lib/jchkmail') do
      it { should be_directory }
      it { should be_mode 755 }
      it { should be_owned_by 'jchkmail'}
      it { should be_grouped_into 'root'}
    end

    describe file('/etc/jchkmail/cdb') do
      it { should be_directory }
      it { should be_mode 755 }
      it { should be_owned_by 'root'}
      it { should be_grouped_into 'root'}
    end


    describe file('/var/spool/jchkmail') do
      it { should be_directory }
      it { should be_mode 755 }
      it { should be_owned_by 'jchkmail'}
      it { should be_grouped_into 'jchkmail'}
    end

    describe package('jchkmail') do
      it { should be_installed }
    end

    describe package('make') do
      it { should be_installed }
    end

    describe service('jchkmail') do
      it { should be_enabled }
      it { should be_running }
    end

    describe service('jgreyd') do
      it { should be_enabled }
      it { should be_running }
    end

  end
end
