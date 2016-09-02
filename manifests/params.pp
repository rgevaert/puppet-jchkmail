# Class jchkmail::params
# ======================
#
#
class jchkmail::params
{
  $jndccf     = 'puppet:///modules/jchkmail/j-ndc.cf'

  ### j-chkmail parameters ###
  $jchkmail_version = 'v2.3.1'

  ### Override parameters can be defined by the user by passing a hash ###
  $config = {}
    ### example ###
    #  $config = {
    #    'PRESENCE'     => 'HIDE',
    #    'MAX_BADRCPTS' => '100'
    #  }
}
