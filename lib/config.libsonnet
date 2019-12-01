local config = {
  params+:: {
    ntppool+:: {
      containerPort: 8299,
      image: 'quay.io/ntppool/ntppool:aac0645',
      name: 'ntppool',
      imagePullSecrets: [],
      replicas: 2,
    },
  },
  config+:: {
        db_dsn: 'dbi:mysql:database=ntpbeta;host=192.168.99.1',
        db_user: 'ntpbeta',
        manage_hostname: 'manage.ntp.cluster',
        manage_tls: 'yes',
  },
};

config
