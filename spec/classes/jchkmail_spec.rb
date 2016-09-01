require 'spec_helper'

describe 'jchkmail' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "jchkmail class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('jchkmail') }
          it { is_expected.to contain_class('jchkmail::cdbupdate') }
          it { is_expected.to contain_class('jchkmail::conf') }
          it { is_expected.to contain_class('jchkmail::package') }
          it { is_expected.to contain_class('jchkmail::params') }
          it { is_expected.to contain_class('jchkmail::service') }
          it { is_expected.to contain_exec('cdb-update').with(
            :command     => '/usr/sbin/service jchkmail reload ; /usr/bin/make -C /etc/jchkmail/cdb',
            :refreshonly => true,) }
          it { is_expected.to contain_file('/etc/jchkmail/j-chkmail.cf').with(
            :source => 'puppet:///modules/jchkmail/j-chkmail.cf',) }
          it { is_expected.to contain_file('/etc/jchkmail/j-ndc.cf').with(
            :source => 'puppet:///modules/jchkmail/j-ndc.cf',) }
          it { is_expected.to contain_file('/var/lib/jchkmail').with(
            :ensure  => 'directory',
            :owner   => 'jchkmail',
            :recurse => 'true',) }
          it { is_expected.to contain_file('/var/spool/jchkmail').with(
            :ensure  => 'directory',
            :owner   => 'jchkmail',
            :group   => 'jchkmail',) }
          it { is_expected.to contain_package('jchkmail').with(
            :ensure => 'present',) }
          it { is_expected.to contain_package('make').with(
            :ensure => 'installed',) }
          it { is_expected.to contain_service('jchkmail').with(
            :ensure     => 'running',
            :hasstatus  => 'false',
            :hasrestart => 'true',
            :enable     => 'true',
            :pattern    => 'j-chkmail',) }
          it { is_expected.to contain_service('jgreyd').with(
            :ensure     => 'running',
            :hasstatus  => 'false',
            :hasrestart => 'true',
            :enable     => 'true',
            :pattern    => 'j-greyd',) }
        end
      end
    end
  end

end
