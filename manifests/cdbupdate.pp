# Class jchkmail::cdbupdate
# =========================
#
#
class jchkmail::cdbupdate
{
  exec {
    'cdb-update':
      command     => 'service jchkmail restart ; /usr/bin/make -C /etc/jchkmail/cdb',
      refreshonly => true;
  }
}
