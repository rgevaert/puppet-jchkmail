# Class jchkmail
# ==============
#
#
class jchkmail (
  String $jchkmail_version     = $jchkmail::params::jchkmail_version,
  Hash[String, String] $config = $jchkmail::params::config,
  String $jndccf               = $jchkmail::params::jndccf
) inherits ::jchkmail::params
{

    class{'::jchkmail::package':;} ~>
    class{'::jchkmail::conf':;} ~>
    class{'::jchkmail::service':;} ~>
    class{'::jchkmail::cdbupdate':;}
}
