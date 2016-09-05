This is the jchkmail module.

Usage
=====

    include jchkmail

You can override the default config:

    class {
      'jchkmail':
        jchkmailcf => <path>,
        jndccf     => <path>;
    }

Defining the maps

    jchkmail::cdb {
      'j-policy.z-defaults.txt':
        source => <path>;
    }

Defining a different makefile for the cdb maps:

    jchkmail::jconf {
      'cdb/Makefile':
        source => <path>;
    }

Override parameters can be defined by the user by passing a hash

    $config = {
      'PRESENCE'     => 'HIDE',
      'MAX_BADRCPTS' => '100'
    }
