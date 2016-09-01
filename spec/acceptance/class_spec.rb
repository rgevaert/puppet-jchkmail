require 'spec_helper_acceptance'

describe 'jchkmail class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'jchkmail': }
      EOS

      # Run it twice and test for idempotency
#      apply_manifest(pp, :catch_failures => true)
#      apply_manifest(pp, :catch_failures => true)
    end
  end
end
