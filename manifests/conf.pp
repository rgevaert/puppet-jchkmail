# Class jchkmail::conf
# ====================
#
#
class jchkmail::conf
{
  file{
    '/etc/jchkmail/j-chkmail.cf':
      source => $jchkmail::jchkmailcf;
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
