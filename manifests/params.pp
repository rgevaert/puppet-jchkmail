# Class jchkmail::params
# ======================
#
#
class jchkmail::params
{
  $jndccf     = 'puppet:///modules/jchkmail/j-ndc.cf'

  # j-chkmail override parameters
  $jchkmail_version = 'v2.3.1'
  $check_badrcpts   = 'YES'
  $max_badrcpts     = '10'

  # Override parameters can be defined by the user by passing a hash
  $config = {}
}
