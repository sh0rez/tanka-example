{
  apiVersion: 'v1',
  kind: 'ResourceQuota',
  metadata: {
    name: 'ntppool',
  },
  spec: {
    hard: {
      'limits.cpu': '16',
      'limits.memory': '12Gi',
      pods: '15',
      'requests.cpu': '5',
      'requests.memory': '5Gi',
    },
  },
}
