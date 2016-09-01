# Class jchkmail::cdbupdate
# =========================
#
#
class jchkmail::cdbupdate
{
  exec {
    'cdb-update':
      command     => '/usr/sbin/service jchkmail reload ; /usr/bin/make -C /etc/jchkmail/cdb',
      refreshonly => true;
  }
}
