# Class jchkmail::cdb
# ===================
#
#
define jchkmail::cdb (
  String $ensure   = 'present',
  $source   = '',
  $template = ''
){

  if ( empty($source) and empty($template)) {
    fail('source and template must not be empty.  Set one')
  }

  if empty($source) {
    $_source = undef
  }else{
    $_source = $source
  }

  if empty($template) {
    $_content= undef
  }else {
    $_content= template($template)
  }

  File {
    require => Class['jchkmail'],
  }

  file{ $name:
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0644',
    path    => "/etc/jchkmail/cdb/${name}",
    notify  => Class['jchkmail::cdbupdate'],
    source  => $_source,
    content => $_content,
  }

}
