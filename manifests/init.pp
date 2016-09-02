# Class jchkmail
# ==============
#
#
#lint:ignore:class_inherits_from_params_class
class jchkmail (
  $jchkmail_version = $jchkmail::params::jchkmail_version,
  $check_badrcpts   = $jchkmail::params::check_badrcpts,
  $max_badrcpts     = $jchkmail::params::max_badrcpts,
  $jndccf           = $jchkmail::params::jndccf
) inherits ::jchkmail::params
{

    class{'::jchkmail::package':;} ~>
    class{'::jchkmail::conf':;} ~>
    class{'::jchkmail::service':;} ~>
    class{'::jchkmail::cdbupdate':;}
}
# lint:endignore
