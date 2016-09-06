# Class jchkmail::cdbupdate
# =========================
#
#
class jchkmail::cdbupdate
{
  exec {
    'cdb-update':
      command     => '/usr/bin/make -C /etc/jchkmail/cdb',
      refreshonly => true;
  }
}
