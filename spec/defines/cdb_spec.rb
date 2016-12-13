require 'spec_helper'

describe 'jchkmail::cdb' do
  let :title do
    'mycdb'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context "with source parameter" do
        let :params do
          {
            :source => '/location/mycdb'
          }
        end
        it { is_expected.to contain_file('mycdb').with(
          :ensure  => 'present',
          :owner   => 'root',
          :group   => 'root',
          :mode    => '0644',
          :path    => '/etc/jchkmail/cdb/mycdb',
          :notify  => 'Class[Jchkmail::Cdbupdate]',
          :source  => '/location/mycdb',
          :content => nil) }
      end

      context "with template parameter" do
        let :params do
          {
            :template => 'jchkmail/cdb.erb'
          }
        end
        it { is_expected.to contain_file('mycdb').with(
          :ensure  => 'present',
          :owner   => 'root',
          :group   => 'root',
          :mode    => '0644',
          :path    => '/etc/jchkmail/cdb/mycdb',
          :notify  => 'Class[Jchkmail::Cdbupdate]',
          :source  => nil,
          :content => /^# Sample cdb erb$/,) }
      end

    end
  end
end
