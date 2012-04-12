class jchkmail::service
{
  service {
    'jchkmail':
      ensure     => running,
      hasstatus  => false,
      hasrestart => true,
      pattern    => 'j-chkmail';
    'jgreyd':
      ensure     => running,
      hasstatus  => false,
      hasrestart => true,
      pattern    => 'j-greyd';
  }

}
