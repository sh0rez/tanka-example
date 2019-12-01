// k.libsonnet with helpers by Grafana Labs
local k = import 'ksonnet-util/kausal.libsonnet';

// config schema partial for this lib
local config = import 'config.libsonnet';

config + k {
  local secret = $.core.v1.secret,
  local deployment = $.apps.v1beta1.deployment,
  local container = $.core.v1.container,

  ntppool: {
    // Secret for configuration
    // Note we are referring to the config as $._config, not as config, because we want the version overridden by main.jsonnet
    secret: secret.new('ntppool-secrets', $._config.ntppool.config),

    // creating the deployment with a container
    deployment: deployment.new("ntppool", $._config.ntppool.replicas, [
      container.new("ntppool", $._images.ntppool)
    ]) +
    $.util.secretVolumeMount('ntppool-secrets', '/foo/ntppool')
  }
}
