{
  // Config schema. Can be overwritten in main.jsonnet
  // using +:: to not override other libraries
  _config+:: {
    // Only define values under subkey, to avoid collisions with other libraries.
    ntppool: {
      name: "ntppool",
      containerPort: 8299,
      replicas: 2,

      // configMap contents:
      config: {
        manage_hostname: "manage.ntp.cluster",
        manage_tls: "yes",
        // example of mandatory fields
        db_dsn: error "ntppool: must set db_dsn",
        db_user: error "ntppool: must set db_user",
      }
    }
  },

  // images to use
  _images+:: {
    ntppool: 'quay.io/ntppool/ntppool:aac0645',
  }
}
