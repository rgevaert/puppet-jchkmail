class jchkmail::conf
{
  file{
    'j-chkmail.cf':
      name   => '/etc/jchkmail/j-chkmail.cf',
      source => $jchkmail::jchkmailcf;
    'j-ndc.cf':
      name   => '/etc/jchkmail/j-ndc.cf',
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
