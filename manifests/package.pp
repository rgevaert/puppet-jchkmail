# Class jchkmail::package
# =======================
#
#
class jchkmail::package
{
  package {
    'jchkmail':
      ensure => present;
  }

  if !defined(Package['make']) {
    package { 'make':
      ensure => installed;
    }
  }
}
