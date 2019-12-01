// import the library
local ntppool = import 'ntppool/ntppool.libsonnet';

ntppool + {
  // override some config keys
  _config+:: {
    ntppool+:: {
      manage_tls: 'no',
      config+:: {
        db_dsn: "fooDSN",
        db_user: "myUser"
      }
    },
  },
  _images+:: {
    ntppool: 'quay.io/ntppool/ntppool:latest',
  },
}
