# Class jchkmail::conf
# ====================
#
#
class jchkmail::conf(
  String $jchkmail_version = $jchkmail::jchkmail_version
){
  file{
    '/etc/jchkmail/j-chkmail.cf':
      ensure  => file,
      content => template('jchkmail/header.erb', "jchkmail/default-${jchkmail_version}.erb", 'jchkmail/override.erb');
    '/etc/jchkmail/j-ndc.cf':
      source => $jchkmail::jndccf;
  }

  file{
    '/var/lib/jchkmail':
      ensure  => directory,
      owner   => 'jchkmail',
      recurse => true;
    '/var/spool/jchkmail':
      ensure  => directory,
      owner   => 'jchkmail',
      group   => 'jchkmail';
  }
}
