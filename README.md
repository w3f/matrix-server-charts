[![CircleCI](https://circleci.com/gh/w3f/matrix-server-charts.svg?style=svg)](https://circleci.com/gh/w3f/matrix-server-charts)

# matrix-server-charts test

Deploys synapse and element-web. Uses upstream images for both and the stable chart for synapse's postgresql database.

## Files

These are the main directories in the repo:

*  charts/matrix-server: contains the synapse manifest, including:
   *  certificate: defines the SSL certificate for the matri server endpoint to be used by cert-manager.
   *  configmap-log and configmap-synapse: matrix server configuration.
   *  secret-signing-key: signing key required by synapse config.
   *  servicemonitor: custom resource that allows prometheus to scrape the service's metrics endpoint.
   *  statefulset: the synapse pod is defined as a statefulset so that it can connect to the data persistent volume in isolation.

*  charts/element-web: manifests for a self-hosted element-web:
   *  certificate: defines the SSL certificate for the element-web endpoint to be used by cert-manager.
   *  configmap: element-web configuration.
   *  deployment: in this case the pods are stateless and we can spin up more than one (two) by default.
