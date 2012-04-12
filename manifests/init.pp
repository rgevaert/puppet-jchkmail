class jchkmail (
  $jchkmailcf = $jchkmail::params::jchkmailcf,
  $jndccf     = $jchkmail::params::jndccf
) inherits jchkmail::params

{
  class{'jchkmail::package':;} ~>
    class{'jchkmail::conf':;} ~>
    class{'jchkmail::service':;} ~>
    class{'jchkmail::cdbupdate':;}
}
