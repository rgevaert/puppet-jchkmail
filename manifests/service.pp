# Class jchkmail::service
# =======================
#
#
class jchkmail::service
{
  service {
    'jchkmail':
      ensure     => running,
      hasstatus  => false,
      hasrestart => true,
      enable     => true,
      pattern    => 'j-chkmail';
    'jgreyd':
      ensure     => running,
      hasstatus  => false,
      hasrestart => true,
      enable     => true,
      pattern    => 'j-greyd';
  }

}
