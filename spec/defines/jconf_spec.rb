require 'spec_helper'

describe 'jchkmail::jconf' do
  let :title do
    '/etc/jchkmail/myconf'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let :params do
        {
          :source => '/etc/jchkmail/myconf'
        }
      end

      context "with custom jconf parameters" do
        it { is_expected.to contain_file('/etc/jchkmail/myconf').with(
          :ensure => 'present',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0644',
          :notify => 'Class[Jchkmail::Service]',
          :source => '/etc/jchkmail/myconf',) }
      end
    end
  end
end
