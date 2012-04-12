define jchkmail::jconf ($source, $ensure = 'present')
{
  File {
    require => Class['jchkmail']
  }

  file{
    $name:
      ensure => $ensure,
      owner  => root,
      group  => root,
      mode   => '0644',
      name   => "/etc/jchkmail/${name}",
      notify => Class['jchkmail::service'],
      source => $source;
  }
}
