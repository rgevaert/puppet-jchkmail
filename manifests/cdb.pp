# Class jchkmail::cdb
# ===================
#
#
define jchkmail::cdb (
  String $source,
  String $ensure = 'present'
){
  File {
    require => Class['jchkmail'],
  }

  file{
    $name:
      ensure => $ensure,
      owner  => root,
      group  => root,
      mode   => '0644',
      name   => "/etc/jchkmail/cdb/${name}",
      notify => Class['jchkmail::cdbupdate'],
      source => $source;
  }
}
