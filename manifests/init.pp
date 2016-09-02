# Class jchkmail
# ==============
#
#
#lint:ignore:class_inherits_from_params_class
class jchkmail (
  $jchkmail_version = $jchkmail::params::jchkmail_version,
  $config           = $jchkmail::params::config,
  $jndccf           = $jchkmail::params::jndccf
) inherits ::jchkmail::params
{

    class{'::jchkmail::package':;} ~>
    class{'::jchkmail::conf':;} ~>
    class{'::jchkmail::service':;} ~>
    class{'::jchkmail::cdbupdate':;}
}
# lint:endignore
