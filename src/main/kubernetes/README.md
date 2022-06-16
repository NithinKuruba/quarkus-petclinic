# Deployment to Openshift

## Steps

### Create a Secret

- Update below yaml and create a secret
    ```yaml
    apiVersion: v1
    kind: Secret
    metadata:
    name: quarkus-petclinic-oidc-config
    namespace: <your_namespace>
    type: Opaque
    stringData:
    QUARKUS_OIDC_CLIENT_ID: <OIDC_CLIENT_ID>
    QUARKUS_OIDC_CREDENTIALS_SECRET: <OIDC_CLIENT_SECRET>
    ```

### Deploy apps

- Run `./petclinic.sh`