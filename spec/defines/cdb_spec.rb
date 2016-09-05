require 'spec_helper'

describe 'jchkmail::cdb' do
  let :title do
    '/etc/jchkmail/cdb/mysource'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      
      let :params do
        {
          :source => '/etc/jchkmail/cdb/mysource'
        }
      end

      context "with custom cdb parameters" do
        it { is_expected.to contain_file('/etc/jchkmail/cdb/mysource').with(
          :ensure => 'present',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0644',
          :notify => 'Class[Jchkmail::Cdbupdate]',
          :source => '/etc/jchkmail/cdb/mysource',) }
      end
    end
  end
end
